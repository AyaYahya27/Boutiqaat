//
//  CelebritiesViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit

class CelebritiesViewController:  NavigationViewController{
  
    let celebrityViewModel = CelebrityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nav(color: .white, title: "Celebrities")
        celebrityViewModel.callApi {
            self.collectionView.reloadData()
        }
        view.backgroundColor = .brown
    }
    
    init(){
      
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

