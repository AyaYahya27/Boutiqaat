//
//  CollectionViewCell.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 14/11/2021.
//

import UIKit
import SDWebImage



class CelebrityCarousalCell: UICollectionViewCell {
    
    static let id = "CelebrityCarousalCell"
    var celebrityPayload : BoutiqaatSection? = nil
    private  var image = UIImage()
    var startIndex = 0
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(CelebrityCard.self, forCellWithReuseIdentifier: CelebrityCard.id)
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

extension CelebrityCarousalCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.33, height: collectionView.frame.width / 3.33)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if celebrityPayload != nil{
            return (celebrityPayload?.banners.count)! / 2
        }
        else{
            return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CelebrityCard.id, for: indexPath) as! CelebrityCard
        
        if  celebrityPayload != nil {
            let celebrity = celebrityPayload?.banners[indexPath.row + startIndex]
            if let url = URL(string: celebrity!.imageUrl){
                cell.celebrityImage.sd_setImage(with: url, placeholderImage: UIImage())
            }
            cell.celebrityImage.setDimensions(height: UIScreen.main.bounds.width / 3 ,width: UIScreen.main.bounds.width / 3.33333)
            cell.celebrityName.text = celebrity?.label
            
        }
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        return cell
    }
    
    
}



