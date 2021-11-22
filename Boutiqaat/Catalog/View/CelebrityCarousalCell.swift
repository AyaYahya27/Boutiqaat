//
//  CollectionViewCell.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 14/11/2021.
//

import UIKit



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
    
    func load(url: URL) {
        
        if let data = try? Data(contentsOf: url)
        {
            let image: UIImage = UIImage(data: data)!
            self.image = image
        }
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
            
            load(url: URL(string: (self.celebrityPayload?.banners[indexPath.row + startIndex].imageUrl)!)!)
            cell.celebrityImage.image = image
            cell.celebrityName.text = celebrityPayload?.banners[indexPath.row + startIndex].label
            
        }
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        return cell
    }
    
    
}



