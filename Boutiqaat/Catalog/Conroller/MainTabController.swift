//
//  MainTabController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit
import SideMenu

class MainTabController: TabBarViewController, MenuControllerDelegate{
        
    //MARK: -Properties
    let favoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapFavorite))
    
     let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(didTapSearch))
    
    private var sideMenu: SideMenuNavigationController?
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = SideMenuController(with: ["Boutiqaat",
                                                "Celebrities",
                                                "Brands",
                                                "Shop by Category",
                                                "TV",
                                                "Account",
                                                "Contact Us",
                                                "My Orders"])
               menu.delegate = self
               sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
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

        rootViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleShowMenu))
        
        rootViewController.navigationItem.rightBarButtonItems = [searchButton, favoriteButton]
        let nav = UINavigationController(rootViewController: rootViewController)
     
        nav.tabBarItem.title = name

        
        return nav
        
    }
    
    
    @objc func handleShowMenu(){
          present(sideMenu!, animated: true, completion: nil)
      }
    
    func didSelectMenuItem(named: String) {
       
                sideMenu?.dismiss(animated: true, completion: nil)
                
                switch named{
                case "Boutiqaat":
                   print("boutiqaat")

                    self.selectedIndex = 0
                    
                case "Celebrities":

                    self.selectedIndex = 1
                    print("pp")
                    
                case "Brands":

                    self.selectedIndex = 2
                
                default:
                    print("Nothing to show")
                }
    }

    @objc func didTapFavorite(){
        print("favorite")
    }
    
    @objc func didTapSearch(){
        print("search")
    }
    
}
