//
//  MainTabController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit
import DropDown

class MainTabController: UITabBarController{
    
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    //MARK: -Helpers
    
    func configureViewControllers(){
        
        tabBar.backgroundColor = .black
        tabBar.tintColor = #colorLiteral(red: 0.6842647791, green: 0.575599134, blue: 0.2034798861, alpha: 1)
        
//        let layout = UICollectionViewFlowLayout()
        //    collectionViewLayout: layout
        let boutiqaat = templateNavigationController(name: "Boutiqaat",  rootViewController: BoutiqaatViewController())
        
//        boutiqaat.navigationBar.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        let navigationFont = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 22), size: 22 )
        appearance.titleTextAttributes = [ .foregroundColor: UIColor.white, .font: navigationFont]
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.title = "Catalog"
        navigationItem.setHidesBackButton(true, animated: true)
        
        let brands = templateNavigationController(name: "Brands",  rootViewController: BrandsViewController())
        
        let celebrities = templateNavigationController(name: "Celebrities", rootViewController: CelebritiesViewController())
        
        let categories = templateNavigationController(name: "Categories", rootViewController: CategoriesViewController())
        
        let myBag = templateNavigationController(name: "My Bag", rootViewController: MyBagViewController())
        
        
        viewControllers = [boutiqaat, brands, celebrities, categories]
        
        
    }
    
    func templateNavigationController(name: String, rootViewController: UIViewController)-> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = name
        //        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = #colorLiteral(red: 0.6842647791, green: 0.575599134, blue: 0.2034798861, alpha: 1)
        //        nav.toolbar.backgroundColor = .brown
        
        return nav
        
    }
    
    
    
    
}
