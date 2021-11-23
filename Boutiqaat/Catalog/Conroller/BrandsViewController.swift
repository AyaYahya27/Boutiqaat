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
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
        super.init(collectionViewLayout: layout)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.contentInset.top = 22
        
        brandsViewModel.callApi { response in
            self.collectionView.reloadData()
            self.spinner.hideSpinner(collectionView: self.collectionView)
            self.sortedBrands = self.brandsViewModel.brandsPayload.sorted { first, second in
                return first.name.compare(second.name) == ComparisonResult.orderedAscending
            }
            self.splitBrands()
            self.arr = [self.data]
//            print("////////////////////////////")
//            print(self.data["B"])
//            print("////////////////////////////")
        }
        
    registerCells()
    }
    
    
    func registerCells(){
        collectionView.register(BrandsCell.self, forCellWithReuseIdentifier: BrandsConstants.cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
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
    
    
    func loadiMAGE(url: URL, placeholderImage: UIImage? = nil, completion: @escaping(UIImage) -> Void){
           
        imageView.af.setImage(
                withURL: url,
                placeholderImage: placeholderImage) {(imageResult) in
                    switch imageResult.result{
                        case .success(_ ):
    //                    print(imageResult)
                        
                        completion(self.imageView.image!)
                        
                    case .failure(_ ):
                        print(imageResult.error?.localizedDescription)
//                        print(imageResult)
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
//            return brandsViewModel.brandsPayload.count
            if !data.isEmpty{
            return data[sections[section]]!.count
               
            }
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
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        headerView.backgroundColor = UIColor.blue
        headerView.frame.size.height = 50
        headerView.frame.size.width = 20
        return headerView

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return sections.count
    }
    

}
