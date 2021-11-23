//
//  CategoriesViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//


import UIKit
import SDWebImage

class CategoriesViewController:  NavigationViewController{
    
    let categoryViewModel = CategoryViewModel()
    let imageLoad = ImageLoad()
    let spinner =  LoadSpinner()
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        configureView()
        
        if categoryViewModel.payload.isEmpty {
            spinner.showSpinner(collectionView: collectionView)
        }
        DispatchQueue.main.async {
            self.categoryViewModel.callApi {
                self.collectionView.reloadData()
                self.spinner.hideSpinner(collectionView: self.collectionView)
            }
        }
        
        
        
    }
    
    
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        super.init(collectionViewLayout: layout)
    }
    
    
    func configureView(){
        nav(color: .white, title: "Categories")
        
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.id)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}







extension CategoriesViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width  , height: collectionView.frame.height / 7)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if  categoryViewModel.payload.count != 0{
            return (categoryViewModel.payload.count)
        }else{
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
        
        if  categoryViewModel.payload.count != 0{
            if let url = URL(string: categoryViewModel.payload[indexPath.row].category_image_rectangle){
                cell.imageView.sd_setImage(with: url, placeholderImage: UIImage())
            }
            
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
        }
        
        return cell
    }
}


