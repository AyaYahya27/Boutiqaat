//
//  CollectionViewCell.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 14/11/2021.
//

import UIKit



class CelebrityCarousalCell: UICollectionViewCell {
   static let id = "CelebrityCarousalCell"

    
    
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
        self.backgroundColor = .green
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension CelebrityCarousalCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CelebrityCard.id, for: indexPath) as!    CelebrityCard
        return cell
    }
    
    
}



