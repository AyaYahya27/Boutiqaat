//
//  CarouselCard.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 15/11/2021.
//

import UIKit

class CarouselCard: UICollectionViewCell{
    static let id = "CarouselCard"
    
    private var image : UIImageView = {
        let image = UIImage(systemName: "heart")
        let img = UIImageView(image: image)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.addSubview(image)
//        image.anchor(top: self.topAnchor, width: UIScreen.main.bounds.width,  height: 220)
        self.backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
