//
//  CarouselCell.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 15/11/2021.
//

import UIKit

class CarouselCell: UICollectionViewCell{
    
    static let id = "CarouselCell"

     
     
    let collectionView : UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.minimumLineSpacing = 0.0
         layout.minimumInteritemSpacing = 0.0
         layout.scrollDirection = .horizontal
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CarouselCard.self, forCellWithReuseIdentifier: CarouselCard.id)
         cv.isPagingEnabled = true
         return cv
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .green
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.addSubview(collectionView)

        collectionView.backgroundColor = .red
//        collectionView.
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
        
       var cardIndex = 0
        
         Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

             if cardIndex < 3{
                 let indexPath = IndexPath(item: cardIndex, section: 0)
                 self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                 cardIndex += 1
             }
             else {
                 cardIndex = 0
                 let indexPath = IndexPath(item: cardIndex, section: 0)
                 self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

             }

        }
       
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CarouselCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width  , height: collectionView.frame.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCard.id, for: indexPath) as! CarouselCard
        cell.frame.size.width = UIScreen.main.bounds.width
        return cell
    }
 
    

}
