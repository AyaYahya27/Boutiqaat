//
//  CategoriesViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//


import UIKit

class CategoriesViewController:  NavigationViewController{
    
//    let nav = NavigationViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        nav(color: .green, title: "sdfghjkl")
        
        view.backgroundColor = .brown
    }
    
    init(){
      
        let layout = UICollectionViewLayout()
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

