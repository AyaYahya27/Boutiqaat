//
//  CelebrityCard.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 15/11/2021.
//

import UIKit

class CelebrityCard: UICollectionViewCell {
    
    
    static let id = "CelebrityCard"
    
    private var image : UIImageView = {
        let image = UIImage(systemName: "heart")
        let img = UIImageView(image: image)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
