//
//  BoutiqaatViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit

class BoutiqaatViewController: UIViewController{
    
    
   
   
    
    private let productimage = ProductCard(image: UIImage(systemName: "exclamationmark.circle")! , name: "product", description: "description", price: 2.55)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(productimage)
//        productimage.setWidth(300)
//        productimage.setHeight(400)
        
        productimage.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        
    }
    
    
}

