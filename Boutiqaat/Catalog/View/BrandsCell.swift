//
//  BrandsCell.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 22/11/2021.
//

import UIKit

class BrandsCell: UICollectionViewCell{
    
    //MARK: -Properties
    
    let brandImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        let image = UIImage(systemName: "heart")
        imageView.image = image
        imageView.backgroundColor = #colorLiteral(red: 0.9578720927, green: 0.9524629712, blue: 0.9742853045, alpha: 1)
        imageView.setDimensions(height:50 ,width: UIScreen.main.bounds.width/3 )
        return imageView
    }()
    
    let brandName: UILabel = {
        let label = UILabel()
        label.text = "ghazal"
        
        return label
    }()
    
    let separator: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray
        
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(brandImage)
        brandImage.centerY(inView: self)
        brandImage.anchor(left: self.leftAnchor, paddingLeft: 10)
        
        addSubview(separator)
        separator.anchor(left: brandImage.rightAnchor, paddingLeft: 5)
        separator.centerY(inView: self)
        separator.setDimensions(height:30 ,width: 1 )
        
        addSubview(brandName)
        brandName.anchor(left: separator.rightAnchor, paddingLeft: 15)
        brandName.centerY(inView: self)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        brandImage.af.cancelImageRequest()
                brandImage.layer.removeAllAnimations()
                brandImage.image = nil
        brandName.text = ""

    }
}
