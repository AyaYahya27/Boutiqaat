//
//  LoadSpinner.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 23/11/2021.
//

import UIKit

class LoadSpinner{
    
    let loadingSpinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = #colorLiteral(red: 0.6756930351, green: 0.588275969, blue: 0.2006502151, alpha: 1)
       return spinner
   }()
    
    func showSpinner(collectionView: UICollectionView){
        collectionView.addSubview(loadingSpinner)
        loadingSpinner.startAnimating()
        let x = UIScreen.main.bounds.width/2
        let y = UIScreen.main.bounds.height/2.8
        loadingSpinner.center = CGPoint(x: Int(x), y: Int(y))
        let transfrom = CGAffineTransform.init(scaleX: 2, y: 2)
        loadingSpinner.transform = transfrom
        
        
      
    }
    
    func hideSpinner(collectionView: UICollectionView ){
        loadingSpinner.removeFromSuperview()
        
        loadingSpinner.stopAnimating()
    }
}

