//
//  ProductCard.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 07/11/2021.
//

import UIKit

class ProductCard : UIView {
    
    private var productImage = UIImage()
    private var productName = ""
    private var productDescription = ""
    private var productPrice : Float = 0.0
    private let width = CGFloat(180)
    private let height = CGFloat(250)
 
    
    init(image : UIImage, name: String , description: String , price: Float){
        super.init(frame: .zero)
        
        productImage = image
        productName = name
        productDescription = description
        productPrice = price
        self.backgroundColor = .white
        self.setWidth(width)
        self.setHeight(height)
        
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView(){
       let image = productImageView(image: productImage)
        addSubview(image)
        print(self.frame.width)
        image.anchor(top: self.topAnchor, width: width, height: width)
    }
    
    func productImageView(image : UIImage) -> UIImageView{
    
        let productImage  = UIImageView(image: image)
        productImage.contentMode = .scaleToFill
        productImage.clipsToBounds = true
        productImage.tintColor = #colorLiteral(red: 0.6871555448, green: 0.575466454, blue: 0.1973420084, alpha: 1)
        return productImage
        
    }
    
}
