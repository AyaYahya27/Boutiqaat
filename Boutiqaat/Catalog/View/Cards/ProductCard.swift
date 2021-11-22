//
//  ProductCard.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 07/11/2021.
//

import UIKit

class ProductCard :UICollectionViewCell{
    
    let imageLoad = ImageLoad()
    static let id = "CollectionTableViewCell"
    
    let width = (UIScreen.main.bounds.width/2)-20
    
    var productPrice = "0.000"
    var currency = "KWD"
    
    private var buyButton : UIButton =
    {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle("BUY NOW", for:  .normal)
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        return button
        
    }()
    
    
    
    
         var nameLabel : UILabel = {
            let label = UILabel()
            let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 15), size: 15)
            label.attributedText = NSAttributedString(string: "product Name" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 1), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
             label.numberOfLines = 0
             return label
        }()
    
    
    
         var descriptionLabel : UILabel = {
            let label = UILabel()
            let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 13), size: 13)
            label.attributedText = NSAttributedString(string: "description" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 1), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
            label.numberOfLines = 0
            return label
        }()
    

    
    
    var addToFavoriteButton : UIButton =
     {
 
         let button = UIButton(type: .system)
         button.setWidth(50)
         let image = UIImage(systemName: "heart")
         button.setImage(image, for: .normal)
         button.tintColor = .black
         button.layer.cornerRadius = 10
         button.layer.maskedCorners = [ .layerMaxXMaxYCorner]
         button.backgroundColor = .lightGray
         return button
 
     }()
    
    
    var productImage : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        let image = UIImage()
        imageView.image = image
        imageView.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner]
 
        return imageView
    }()
    
    
        var priceLabel : UILabel = {
            let label = UILabel()
            let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 15), size: 15)
            label.attributedText = NSAttributedString(string: "00.000" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 1), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
            return label
        }()
    
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView(){
        
        layer.masksToBounds = false
        layer.cornerRadius = 10
        self.backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        addSubview(productImage)
        productImage.anchor(top: self.topAnchor,left: self.leftAnchor,right: self.rightAnchor,  height: UIScreen.main.bounds.width/2.5)

        addSubview(nameLabel)
        nameLabel.anchor(top: productImage.bottomAnchor, left: self.leftAnchor ,paddingTop: 8, paddingLeft: 10)
        
                addSubview(descriptionLabel)
                descriptionLabel.anchor(top: nameLabel.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor ,paddingTop: 8, paddingLeft: 10, paddingRight: 10)
        
        
        
        let buttonStack = UIStackView(arrangedSubviews: [buyButton, addToFavoriteButton])
        buttonStack.axis = .horizontal
        addSubview(buttonStack)
        buttonStack.anchor(  bottom: self.bottomAnchor, width: width, height: 45)
        
        priceLabel.text = productPrice + " " + currency
        addSubview(priceLabel)
        priceLabel.anchor(  left: self.leftAnchor, bottom: buttonStack.topAnchor, paddingLeft: 10, paddingBottom: 8)
       
    }
    
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func load(url: URL) {
//        
//        if let data = try? Data(contentsOf: url) {
//            if let image = UIImage(data: data) {
//                
//                self.productImage.image = image
//                
//            }
//            
//        }
//    }
    
    
}

