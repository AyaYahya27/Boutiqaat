//
//  BrandsViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit
import AlamofireImage
import SDWebImage


class BrandsViewController:  NavigationViewController{
    
    let spinner =  LoadSpinner()
    let brandsViewModel = BrandsViewModel()
    var sortedBrands = [BrandModel]()
    var imageView = UIImageView()
    var data = Dictionary<Character, [BrandModel]>()
    var sections = [Character]()
    var arr = [Dictionary<Character, [BrandModel]>]()
    
    
    init(){
      
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 20)
        super.init(collectionViewLayout: layout)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        collectionView.delegate = self
        collectionView.dataSource = self

        
        brandsViewModel.callApi { response in
            self.collectionView.reloadData()
            self.spinner.hideSpinner(collectionView: self.collectionView)
            self.sortedBrands = self.brandsViewModel.brandsPayload.sorted { first, second in
                return first.name.compare(second.name) == ComparisonResult.orderedAscending
            }
            self.splitBrands()
            self.arr = [self.data]

        }
        
    registerCells()
    }
    
    
    func registerCells(){
        collectionView.register(BrandsCell.self, forCellWithReuseIdentifier: BrandsConstants.cellId)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    
    func splitBrands(){
        self.sortedBrands.forEach { (BrandModel) in
            let firstCharacter = BrandModel.name.first!
            if var array = self.data[firstCharacter] {
                array.append(BrandModel)
                self.data[firstCharacter] = array
            } else {
                let array = [BrandModel]
                self.data[firstCharacter] = array
                self.sections.append(firstCharacter)
//                print(firstCharacter)
            }
        }
    }
    


    
    
    
   
    
    func configUI(){
        nav(color: .white, title: "Brands")
        spinner.showSpinner(collectionView: collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BrandsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/15)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !brandsViewModel.brandsPayload.isEmpty{

            return data[sections[section]]!.count
               
        }
        
            return 0
            
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandsConstants.cellId, for: indexPath) as! BrandsCell
        cell.backgroundColor = #colorLiteral(red: 0.9578720927, green: 0.9524629712, blue: 0.9742853045, alpha: 1)
        let char = sections[indexPath.section]
        let arr = data[char]
        if !brandsViewModel.brandsPayload.isEmpty{
            cell.brandName.text = arr![indexPath.row].name
            if let url = URL(string: arr![indexPath.row].thumbnail){
                cell.brandImage.sd_setImage(with: url, placeholderImage: UIImage())
           
        }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! Header
        
        if !data.isEmpty {
            headerView.backgroundColor = UIColor.gray
            headerView.categoryName.text = String(sections[indexPath.section])
            headerView.viewAllLabel.text = ""
        
        }
        return headerView

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return sections.count
    }
    

}
