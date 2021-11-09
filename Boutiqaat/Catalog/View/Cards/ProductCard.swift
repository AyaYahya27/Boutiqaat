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
    var imageWidth  = CGFloat(50)

 
    
    init(image : UIImage, name: String , description: String , price: Float){
        super.init(frame: .zero)
        
        productImage = image
        productName = name
        productDescription = description
        productPrice = price
//        imageWidth = width
        self.backgroundColor = .white
      

        
        configureView()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
    func configureView(){
       let image = productImageView(image: productImage)
        addSubview(image)
        image.anchor(top: self.topAnchor,  height: imageWidth)
    }
    
    func productImageView(image : UIImage) -> UIImageView{
    
        let productImage  = UIImageView(image: image)
        productImage.contentMode = .scaleToFill
        productImage.clipsToBounds = true
        productImage.tintColor = #colorLiteral(red: 0.6871555448, green: 0.575466454, blue: 0.1973420084, alpha: 1)
        return productImage
        
    }
    
    func setWidth(width : CGFloat){
        imageWidth = width
        
    }
}
