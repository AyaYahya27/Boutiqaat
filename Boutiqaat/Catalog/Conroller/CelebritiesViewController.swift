//
//  CelebritiesViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit
import SDWebImage

class CelebritiesViewController:  NavigationViewController{
    var image = UIImage()
    let spinner =  LoadSpinner()
    let celebrityViewModel = CelebrityViewModel()
    
   
    let AllFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("All", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    let ABCDFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("ABCD", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    let EFGHFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("EFGH", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    
    let IJKLFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("IJKL", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    
    let MNOFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("MNO", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    
    let PQRFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("PQR", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    
    let STUFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("STU", for: .normal)
        button.addRightBorder(.black, width: 1 , left: 0, top: 10 , bottom: -10)
        button.tintColor = .black
        return button
    }()
    
    let VtoZFilterButton : UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("V-Z", for: .normal)
        
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureView()
        DispatchQueue.main.async {
            self.celebrityViewModel.callApi {
                self.collectionView.reloadData()
                self.spinner.hideSpinner(collectionView: self.collectionView)
            }
        }
        
    }
    
    func configureView() {
        
        let buttonStack = UIStackView(arrangedSubviews: [AllFilterButton , ABCDFilterButton, EFGHFilterButton, IJKLFilterButton , MNOFilterButton, PQRFilterButton , STUFilterButton, VtoZFilterButton])
        
      
        buttonStack.axis = .horizontal
        buttonStack.backgroundColor = .white
        buttonStack.distribution = .fillEqually
        buttonStack.addTopBorder(.black, height: 0.5)
        buttonStack.addBottomBorder(.black, height: 0.5)
        collectionView.addSubview(buttonStack)
        buttonStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, width: UIScreen.main.bounds.width, height: 40)
        nav(color: .white, title: "Celebrities")
        collectionView.register(CelebrityCard.self, forCellWithReuseIdentifier: CelebrityCard.id)
        if celebrityViewModel.payload.isEmpty {
            spinner.showSpinner(collectionView: collectionView)
        }
    }
    
    
    
    init(){
      
        let layout = CelebritiesViewController.createLayout()
        super.init(collectionViewLayout: layout)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}


// MARK: - UICollection View Layout configuration
extension CelebritiesViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if celebrityViewModel.payload.isEmpty {
            return 0
        }else {
            return celebrityViewModel.payload.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CelebrityCard.id, for: indexPath) as! CelebrityCard
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        if !celebrityViewModel.payload.isEmpty{
            let celebrity = celebrityViewModel.payload[indexPath.row]
            cell.celebrityName.text = celebrity.name
           if let url = URL(string: celebrity.thumbnail){
               cell.celebrityImage.sd_setImage(with: url, placeholderImage: UIImage())
                cell.showBorder()
                cell.celebrityImage.setDimensions(height: UIScreen.main.bounds.height / 5.5, width: UIScreen.main.bounds.width / 3)
            }
        }

        return cell
       
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        
        let layout =  UICollectionViewCompositionalLayout { sectionNumber, env in
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3333), heightDimension: .fractionalHeight(1)))
            

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(UIScreen.main.bounds.width), heightDimension: .absolute(UIScreen.main.bounds.height / 4.5)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.top = 40
            return section
            
            
            
        }
        
        return layout
    }
  
}


