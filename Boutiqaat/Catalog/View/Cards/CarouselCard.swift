//
//  CarouselCard.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 15/11/2021.
//

import UIKit

class CarouselCard: UICollectionViewCell{
    static let id = "CarouselCard"
  
    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.setDimensions(height: UIScreen.main.bounds.width / 2 ,width: UIScreen.main.bounds.width)
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
       
        imageView.anchor(top: self.topAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
