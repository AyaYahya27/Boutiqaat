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
//        let image = UIImage(systemName: "heart")
//        let img = UIImageView(image: image)
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        let image = UIImage(systemName: "heart")
//        imageView.image = image
        imageView.backgroundColor = .white
        imageView.setDimensions(height:200 ,width: UIScreen.main.bounds.width)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.addSubview(image)
//        image.anchor(top: self.topAnchor, width: UIScreen.main.bounds.width,  height: 220)
        self.backgroundColor = .cyan
        
        addSubview(imageView)
        imageView.centerX(inView: self)
        imageView.anchor(top: self.topAnchor)
    
//            celebrityImage.anchor(top: topAnchor)
//        imageView.setDimensions(height:50 ,width: 50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(url: URL) {
        print("self?.imageView.image")
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.imageView.image = image
                            
                            print("self?.imageView.image")
                        }
                    }
                }
            }
        }
    
  
}
