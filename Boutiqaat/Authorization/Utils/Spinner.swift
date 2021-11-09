//
//  Spinner.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 09/11/2021.
//

import UIKit

class Spinner{
    
    let loadingSpinner : UIActivityIndicatorView = {
       let spinner = UIActivityIndicatorView(style: .large)
       spinner.color = .white
       return spinner
   }()
    
    func showSpinner(button: UIButton){
        button.addSubview(loadingSpinner)
        loadingSpinner.startAnimating()
        loadingSpinner.centerX(inView: button)
        loadingSpinner.centerY(inView: button)
        button.setTitle("", for: .normal)
    }
    
    func hideSpinner(button: UIButton,title: String ){
        loadingSpinner.removeFromSuperview()
        
        loadingSpinner.stopAnimating()
   
        button.setTitle(title, for: .normal)
    }
}

