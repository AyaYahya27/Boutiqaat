//
//  BoutiqaatViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit

class BoutiqaatViewController: NavigationViewController{
    
    let numberOfSections = 3
    
    private let cellId = "cellId"
    static let categoryHeaderId = "categoryHeaderId"
    let headerId = "headerId"
   

    init(){
      
        let layout = BoutiqaatViewController.createLayout()
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        configureView()

    }
    
    
    func configureView(){
        
        nav(color: .white, title: "Boutiqaat")
        collectionView.backgroundColor = .white
        collectionView.contentInset.top = 22
        registerCollectionViewCells()
        collectionView.register(Header.self, forSupplementaryViewOfKind: BoutiqaatViewController.categoryHeaderId, withReuseIdentifier: headerId)
    }
    
    
    func registerCollectionViewCells(){
        
        collectionView.register(CelebrityCarousalCell.self, forCellWithReuseIdentifier: CelebrityCarousalCell.id)
        collectionView.register(ProductCard.self, forCellWithReuseIdentifier: ProductCard.id)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}


// MARK: - UICollection View Layout configuration
extension BoutiqaatViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :  return numberOfCarousalSections()
        case 1 :  return numberOfCelebrityCards()
        case 2 :  return numberOfProuductCards()
        default: return 20
        }
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        header.backgroundColor = .darkGray
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0 : return cellOfCarousal(indexPath: indexPath)
        case 1 : return cellOfCelebrity(indexPath: indexPath)
        case 2 : return cellOfProuduct(indexPath: indexPath)
        default : return cellOfProuduct(indexPath: indexPath)
        }
      
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSections
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        
        let layout =  UICollectionViewCompositionalLayout { sectionNumber, env in
            
            switch sectionNumber {
            case 0 : return carousalSectionLayout()
            case 1 :  return celebritiesSectionLayout()
            case 2 : return productSectionLayout()
            default : return productSectionLayout()
            }
           
        }
        
        return layout
    }
    
}

// MARK: - Carousal Layout configuration
extension BoutiqaatViewController{
    
    func numberOfCarousalSections () -> Int{
        return 5
    }
    
    func cellOfCarousal(indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    static func carousalSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(230)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
}

// MARK: - Celebrity section layout configuration

extension BoutiqaatViewController{
    func  numberOfCelebrityCards () -> Int{
        return 2
    }
    
    func cellOfCelebrity(indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CelebrityCarousalCell.id, for: indexPath) as! CelebrityCarousalCell
//        cell.backgroundColor = .cyan
        return cell
    }
    
   static func celebritiesSectionLayout() -> NSCollectionLayoutSection{
       let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))

       item.contentInsets.trailing = 16
       item.contentInsets.bottom = 16

       let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(300)), subitems: [item])

      
       let section =  NSCollectionLayoutSection(group: group)
       section.orthogonalScrollingBehavior = .continuous

//        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)]
       return section
       
    }
}

// MARK: - Prouduct cards carousal Layout configuration

extension BoutiqaatViewController{
    func  numberOfProuductCards () -> Int{
        return 20
    }
    
    func cellOfProuduct(indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCard.id, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
   static func productSectionLayout() -> NSCollectionLayoutSection{
       let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200)))

       item.contentInsets.trailing = 16
       item.contentInsets.bottom = 16

       let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension:  .fractionalHeight(0.5)), subitems: [item])


       let group2 = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension:  .estimated(400)), subitems: [group])


       group.contentInsets.leading = 16
       let section =  NSCollectionLayoutSection(group: group2)
       section.orthogonalScrollingBehavior = .continuous

//        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)]
        return section
       
    }
}



