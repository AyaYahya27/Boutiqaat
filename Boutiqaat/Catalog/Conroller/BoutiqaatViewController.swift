//
//  BoutiqaatViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit
import SnapKit

class BoutiqaatViewController: NavigationViewController{
    
    //MARK: -Properties
    
    private var boutiqaatViewModel = BoutiqaatViewModel()

    private let womenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Women", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setHeight(45)
        button.setWidth(UIScreen.main.bounds.size.width/2)
        button.addTarget(self, action: #selector(handleWomenPage), for: .touchUpInside)
        
        return button
    }()
    
    private let menButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Men", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setHeight(45)
        button.setWidth(UIScreen.main.bounds.size.width/2)
        button.addTarget(self, action: #selector(handleWomenPage), for: .touchUpInside)
        
        return button
    }()
    
    
    let buttonIndicator: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
    return v
    }()
    
    
    
    let numberOfSections = 4
    
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
        boutiqaatViewModel.callApi()
        configureView()

    }
    
    
    func configureView(){
        
        nav(color: .white, title: "Boutiqaat")
        collectionView.backgroundColor = .white
        collectionView.contentInset.top = 22
        
        
        view.addSubview(womenButton)
        womenButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        womenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        view.addSubview(menButton)
        menButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: womenButton.rightAnchor)
        
        view.addSubview(buttonIndicator)
        buttonIndicator.snp.makeConstraints { (make) in
        make.top.equalTo(womenButton.snp.bottom)
            make.height.equalTo(4.5)
            make.width.equalTo(UIScreen.main.bounds.size.width/2)
        make.centerX.equalTo(womenButton.snp.centerX)
        }
        
        
        registerCollectionViewCells()
        collectionView.register(Header.self, forSupplementaryViewOfKind: BoutiqaatViewController.categoryHeaderId, withReuseIdentifier: headerId)
       
    }
    
    
    func registerCollectionViewCells(){
        
        collectionView.register(CelebrityCarousalCell.self, forCellWithReuseIdentifier: CelebrityCarousalCell.id)
        collectionView.register(ProductCard.self, forCellWithReuseIdentifier: ProductCard.id)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.id)
    }
    
    
    //MARK: -Actions
    
    @objc func handleWomenPage(sender: UIButton){
        if (sender == womenButton){
            print("women pressed")

            buttonIndicator.snp.remakeConstraints { (make) in
            make.top.equalTo(sender.snp.bottom)
                make.height.equalTo(4.5)
                make.width.equalTo(UIScreen.main.bounds.size.width/2)
            make.centerX.equalTo(sender.snp.centerX)
            }
            
        }else {
          print("men pressed")
            
            buttonIndicator.snp.remakeConstraints { (make) in
            make.top.equalTo(sender.snp.bottom)
                make.height.equalTo(4.5)
                make.width.equalTo(UIScreen.main.bounds.size.width/2)
            make.centerX.equalTo(sender.snp.centerX)
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
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
        default : return cellOfCarousal(indexPath: indexPath)
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
            default : return carousalSectionLayout()
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
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.id, for: indexPath) as! CarouselCell

        return cell
    }
    
    
    static func carousalSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 0
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

       let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(400)), subitems: [item])

      
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



