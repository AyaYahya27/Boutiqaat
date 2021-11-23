//
//  CategoryCell.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 21/11/2021.
//

import UIKit


class CategoryCell: UICollectionViewCell {
    static let id = "CategoryCell"
    
    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white

        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.setDimensions(height:  contentView.layer.bounds.height ,width: UIScreen.main.bounds.width)
        contentView.addSubview(imageView)
        
        contentView.backgroundColor = .blue
        imageView.anchor(top: self.topAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
