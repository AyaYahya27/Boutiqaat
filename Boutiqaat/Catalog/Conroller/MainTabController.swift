//
//  MainTabController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit


class MainTabController: TabBarViewController{
    
//   private let sideMenu: SideM
    
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
 
    //MARK: -Helpers
    
    func configureViewControllers(){
        
        tab(color : .black , tintColor: #colorLiteral(red: 0.6842647791, green: 0.575599134, blue: 0.2034798861, alpha: 1))
        
        let boutiqaat = templateNavigationController(name: "Boutiqaat",  rootViewController: BoutiqaatViewController())
        let brands = templateNavigationController(name: "Brands",  rootViewController: BrandsViewController())
        let celebrities = templateNavigationController(name: "Celebrities", rootViewController: CelebritiesViewController())

        let categories = templateNavigationController(name: "Categories", rootViewController: CategoriesViewController())

        let myBag = templateNavigationController(name: "My Bag", rootViewController: MyBagViewController())
        
        
        viewControllers = [boutiqaat, brands, celebrities, categories, myBag]
        
        
        
        
    }
    
    func templateNavigationController(name: String, rootViewController: NavigationViewController)-> UINavigationController{
      

        rootViewController.navigationItem.leftBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(doit))
        let nav = UINavigationController(rootViewController: rootViewController)
     
        nav.tabBarItem.title = name

        
        return nav
        
    }
    
    
    @objc func doit(){
        self.navigationController?.pushViewController(MainTabController(), animated: true)
    }
    
    
    
    
}
