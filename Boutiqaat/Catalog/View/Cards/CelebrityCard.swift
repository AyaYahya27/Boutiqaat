//
//  CelebrityCard.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 15/11/2021.
//

import UIKit

class CelebrityCard: UICollectionViewCell {
    
    
    static let id = "CelebrityCard"
    

    var celebrityImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        let image = UIImage(systemName: "heart")
        imageView.image = image
        imageView.backgroundColor = .white
        return imageView
    }()

     var celebrityName: UILabel = {

           let label = UILabel()
           label.font = UIFont(name:RegisterConstants.navTitleFont, size: 14)
           label.contentMode = .scaleAspectFill
          label.clipsToBounds = true
          label.text = "Noor Elghandoor Boutiqee"
          label.setDimensions(height: 20, width: 115)
           return label
       }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

       configureCard(width: self.bounds.size.width)
   }
    func configureCard(width: Double){
        backgroundColor = .white
        contentView.addSubview(celebrityImage)
        celebrityImage.anchor(top: self.topAnchor)

            addSubview(celebrityName)
        celebrityName.anchor(top: celebrityImage.bottomAnchor, left: self.leftAnchor , paddingTop: 5, paddingLeft: 5)
        
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showBorder (){
        layer.masksToBounds = false
        layer.cornerRadius = 0
        self.backgroundColor = .white
        layer.borderWidth = 0.3
        layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        celebrityName.textAlignment = .center
     
        
    }

}

