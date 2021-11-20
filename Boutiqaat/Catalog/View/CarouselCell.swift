//
//  CarouselCell.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 15/11/2021.
//

import UIKit

class CarouselCell: UICollectionViewCell{
    
    static let id = "CarouselCell"
    var carousalPayload : BoutiqaatSection? = nil
    private  var image = UIImage()
    private var cardNumber = 0

    let collectionView : UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.minimumLineSpacing = 0.0
         layout.minimumInteritemSpacing = 0.0
         layout.scrollDirection = .horizontal
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.backgroundColor = .darkGray
         cv.showsHorizontalScrollIndicator = false
         cv.register(CarouselCard.self, forCellWithReuseIdentifier: CarouselCard.id)
         cv.isPagingEnabled = true
         return cv
     }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .blue
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
            
        
       setTimer()

    }
    
    func setTimer()
    {
        var cardIndex = 0

          Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in


              if cardIndex < self.cardNumber {
 
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


    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        
                            self?.image = image
//                            self?.collectionView.reloadData()
                        
                    }
                }
            }
        }

}

extension CarouselCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width  , height: collectionView.frame.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if  carousalPayload != nil {

            cardNumber = (carousalPayload?.banners.count)!
            return (carousalPayload?.banners.count)!
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCard.id, for: indexPath) as! CarouselCard
        
        if  carousalPayload != nil {
            
            load(url: URL(string: (self.carousalPayload?.banners[indexPath.row].imageUrl)!)!)
            cell.imageView.image = image
//                collectionView.reloadData()
            
//            cell.load(url: URL(string: (carousalPayload?.banners[indexPath.row].imageUrl)!)!)
//            load(url: URL(string: (carousalPayload?.banners[indexPath.row].imageUrl)!)!)
//            cell.imageView.image = image
        }
        return cell
    }
 
    

}
