//
//  CarouselCard.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 15/11/2021.
//

import UIKit

class CarouselCard: UICollectionViewCell{
    static let id = "carousel"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
