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
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        let image = UIImage(systemName: "heart")
        imageView.image = image
        imageView.backgroundColor = .white
        imageView.setDimensions(height: UIScreen.main.bounds.width / 3.33 ,width: UIScreen.main.bounds.width / 3.33 )
        return imageView
    }()

//    private var celebrityName: UILabel = {

//           let label = UILabel()
//           label.font = UIFont(name:RegisterConstants.navTitleFont, size: 14)
//           label.contentMode = .scaleAspectFill
//           label.clipsToBounds = true
//        label.text = "Noor Elghandoor Boutiqee"
//           return label
//       }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
//        self.backgroundColor = .systemPink
//        contentView.addSubview(celebrityImage)
//        celebrityImage.anchor(top: self.topAnchor)
//        celebrityImage.center(inView: self)
       configureCard(width: self.bounds.size.width)
   }
    func configureCard(width: Double){
        backgroundColor = .red
        contentView.addSubview(celebrityImage)
        celebrityImage.anchor(top: self.topAnchor)

//            addSubview(celebrityName)
//        celebrityName.anchor(top: celebrityImage.bottomAnchor, left: self.leftAnchor , paddingTop: 5, paddingLeft: 5)
//            celebrityName.setDimensions(height: 20, width: 115)

        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

