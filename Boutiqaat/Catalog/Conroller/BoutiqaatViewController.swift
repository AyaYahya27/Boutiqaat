//
//  BoutiqaatViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//
//



import UIKit
import SnapKit

class BoutiqaatViewController: NavigationViewController{
    
    
    
    //MARK: -Properties
    private  var image = UIImage()
    let numberOfSections = 3
    private var boutiqaatViewModel = BoutiqaatViewModel()
    private var selectedGender = CatalogConstants.women
    static var showHeaders = false
    
    private let womenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Women", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setHeight(45)
        button.setWidth(UIScreen.main.bounds.size.width/2)
        button.addTarget(self, action: #selector(handleGenderSelection), for: .touchUpInside)
        
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
        button.addTarget(self, action: #selector(handleGenderSelection), for: .touchUpInside)
        return button
    }()
    
    
    let buttonIndicator: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black
        return v
    }()
    
    
    
    init(){
        
        let layout = BoutiqaatViewController.createLayout()
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.boutiqaatViewModel.callApi(sender : self.selectedGender){ payload in
                self.collectionView.reloadData()
                BoutiqaatViewController.showHeaders = true
                self.collectionView.reloadSections([1,2])
                
                
            }
        }
     
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
        
    }
    
    
    func registerCollectionViewCells(){
        
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.headerId)
        
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.id)
        collectionView.register(CelebrityCarousalCell.self, forCellWithReuseIdentifier: CelebrityCarousalCell.id)
        collectionView.register(ProductCard.self, forCellWithReuseIdentifier: ProductCard.id)
    }
    
    
    
    
    
    //MARK: Actions
    
    @objc func handleGenderSelection(sender: UIButton){
        if (sender == womenButton){
            
            selectedGender = CatalogConstants.women
            buttonIndicator.snp.remakeConstraints { (make) in
                make.top.equalTo(sender.snp.bottom)
                make.height.equalTo(4.5)
                make.width.equalTo(UIScreen.main.bounds.size.width/2)
                make.centerX.equalTo(sender.snp.centerX)
            }
            
        }else {
            
            selectedGender = CatalogConstants.men
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
        
        boutiqaatViewModel.callApi(sender: selectedGender) {  payload in
            self.collectionView.reloadData()
            
        }
        
    }
    
    
    func load(url: URL) {
        
        if let data = try? Data(contentsOf: url)
        {
            let image: UIImage = UIImage(data: data)!
            self.image = image
        }
    }
    
    
}
// MARK: - UICollection View Layout configuration
extension BoutiqaatViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
            
        case 0 :  return numberOfCarousalSections()
        case 1 :  return numberOfCelebrityCards()
        case 2 :  return numberOfProuductCards()
        default: return 0
        }
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
            case 1 : return celebritiesSectionLayout()
            case 2 : return productSectionLayout()
            default : return carousalSectionLayout()
            }
            
            
        }
        
        return layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.headerId, for: indexPath) as! Header
        
        if indexPath.section == 1{
            
            header.titleLabel(title: "CELEBRIIES", width: 95)
        }
        else if indexPath.section == 2{
            header.titleLabel(title: "BOUTIQAAT PICKS", width:  150)
        }
        
        return header
    }
}



// MARK: - Carousal Layout configuration


extension BoutiqaatViewController{
    func numberOfCarousalSections () -> Int{
        if !boutiqaatViewModel.payload.isEmpty{
            return 1
        }
        else{
            return 0
        }
    }
    
    func cellOfCarousal(indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.id, for: indexPath) as! CarouselCell
        
        if !boutiqaatViewModel.payload.isEmpty{
            cell.collectionView.reloadData()
            cell.carousalPayload = boutiqaatViewModel.payload[0]
            
        }
        return cell
        
    }
    
    static func carousalSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets.bottom = 16
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(230)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 23
        return section
    }
    
    
    
}


// MARK: - Celebrity section layout configuration

extension BoutiqaatViewController{
    func  numberOfCelebrityCards () -> Int{
        
        if !boutiqaatViewModel.payload.isEmpty{
            return 2
        }
        else{
            return 0
        }
    }
    
    func cellOfCelebrity(indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CelebrityCarousalCell.id, for: indexPath) as! CelebrityCarousalCell
        if  !self.boutiqaatViewModel.payload.isEmpty {
            cell.startIndex = indexPath.row * (boutiqaatViewModel.payload[1].banners.count / 2)
            cell.collectionView.reloadData()
            cell.celebrityPayload = boutiqaatViewModel.payload[1]
        }
       
        return cell
        
    }
    
    static func celebritiesSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension:  .absolute(UIScreen.main.bounds.width)), subitems: [item])
        
        let section =  NSCollectionLayoutSection(group: group)
        
        if showHeaders {
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind:UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
            
        }
        
        return section
    }
    
    
}


// MARK: - Prouduct cards carousal Layout configuration

extension BoutiqaatViewController{
    func  numberOfProuductCards () -> Int{
        if  !self.boutiqaatViewModel.payload.isEmpty {
            return self.boutiqaatViewModel.payload[2].banners.count
        }
        else{
            return 0
        }
    }
    
    func cellOfProuduct(indexPath: IndexPath) -> UICollectionViewCell{
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCard.id, for: indexPath) as! ProductCard
        
        
        if  !self.boutiqaatViewModel.payload.isEmpty {
            let product = self.boutiqaatViewModel.payload[2].banners[indexPath.row]
           
          
            cell.nameLabel.text = product.brandName!
            cell.descriptionLabel.text = product.label
            cell.priceLabel.text = product.mrp! + " " + product.currencyCode!
            load(url: URL(string: product.imageUrl)!)
            cell.productImage.image = image
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
        }
        
        
        return cell
    }
    
    static func productSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets.trailing = 16
        item.contentInsets.bottom = 16
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension:  .absolute(360)), subitems: [item])
        
        group.contentInsets.leading = 8
        let section =  NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        
        if showHeaders {
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), elementKind:UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        }
        
        
        return section
        
    }
    
    
    
}
