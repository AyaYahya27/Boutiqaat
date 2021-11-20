//
//  ProductCard.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 07/11/2021.
//

import UIKit

class ProductCard :UICollectionViewCell{
    
    
    static let id = "CollectionTableViewCell"
    
    
     var productName = ""
    private var productDescription = ""
    private var productPrice : String = ""
    private var currency = ""
    private var viewWidth : CGFloat = UIScreen.main.bounds.width
    
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
    
    var productImage : UIImageView = {
  
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        let image = UIImage(systemName: "heart")
        imageView.image =  image
        imageView.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.setDimensions(height: 100, width: 100)
//        imageView.setDimensions(height:200 ,width: UIScreen.main.bounds.width)
        return imageView
    }()
    
    var priceLabel : UILabel = {
        let label = UILabel()
        let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 15), size: 15)
        label.attributedText = NSAttributedString(string: "00.000" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 1), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
        return label
    }()
    
     var nameLabel : UILabel = {
        let label = UILabel()
        let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 12), size: 12)
        label.attributedText = NSAttributedString(string: "product Name" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 1), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
         label.numberOfLines = 0
         return label
    }()
    
    
     var descriptionLabel : UILabel = {
        let label = UILabel()
        let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 13), size: 13)
        label.attributedText = NSAttributedString(string: "description" , attributes:  [.foregroundColor: UIColor(white: 0, alpha: 0.5), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    var addToFavoriteButton : UIButton =
    {
    
        let button = UIButton(type: .system)
        button.setWidth(50)
        let image = UIImage(systemName: "heart")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.maskedCorners = [ .layerMaxXMaxYCorner]
        button.backgroundColor = .gray
        return button
    
    }()
    
    
    
    
    
//        init(image : UIImage, name: String , description: String , price: String , currency : String){
//            super.init(frame: .zero)
//            productImage = image
//            productName = name
//            productDescription = description
//            productPrice = price
//            self.currency = currency
//        }
//
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView(width : CGFloat, name : String , image: String , price : String , description : String , currency : String ){

        layer.masksToBounds = false
        layer.cornerRadius = 10
        self.backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        viewWidth =  width
        
        self.setWidth(viewWidth)
        self.setHeight(viewWidth * 2)
        
        load(url: URL(string: image)!)
        addSubview(productImage)
        productImage.center(inView: self)
//        productImage.anchor(top: self.topAnchor,left: self.leftAnchor, width: viewWidth,  height: viewWidth)

        nameLabel.text = productName
//        addSubview(nameLabel)
//        nameLabel.anchor(top: productImage.bottomAnchor, left: self.leftAnchor ,paddingTop: 8, paddingLeft: 10)

        descriptionLabel.text = productDescription
//        addSubview(descriptionLabel)
//        descriptionLabel.anchor(top: nameLabel.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor ,paddingTop: 8, paddingLeft: 10)

        let buttonStack = UIStackView(arrangedSubviews: [buyButton, addToFavoriteButton])
        buttonStack.axis = .horizontal
//        addSubview(buttonStack)
//        buttonStack.anchor(  bottom: self.bottomAnchor, width: viewWidth, height: 45)

        priceLabel.text = productPrice + " " +
        currency
//        addSubview(priceLabel)
//        priceLabel.anchor(  left: self.leftAnchor, bottom: buttonStack.topAnchor, paddingLeft: 10)

    
    }
    
//    func productImageView(image : UIImage) -> UIImageView{
//
//        let productImage  = UIImageView(image: image)
//        productImage.contentMode = .scaleToFill
//        productImage.clipsToBounds = true
//        productImage.tintColor = .black
//        productImage.backgroundColor = .white
//        productImage.layer.cornerRadius = 10
//        productImage.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMinYCorner]
//
//        return productImage
//
//    }
    
    func load(url: URL) {
        print("self?.imageView.image")
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.productImage.image = image
                            
                        }
                    }
                }
            }
        }
    
   
  
   
}
