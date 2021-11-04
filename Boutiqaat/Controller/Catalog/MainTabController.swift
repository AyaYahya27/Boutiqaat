//
//  MainTabController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit

class MainTabController:NavigationView{
    
    private var scroller : UIScrollView = {
        let scroll = UIScrollView()
        scroll.setWidth(300)
        scroll.setHeight(300)
        scroll.backgroundColor = .red
        return scroll
    }()
    
    override func viewDidLoad() {
       super.viewDidLoad()
//        configureViewController()
       nav(color: .blue, title: "jjjj")
       view.backgroundColor = .white
    }

    
    func configureViewController(){
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        view.addSubview(scroller)
        scroller.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        
        
        
//        UITabBar.appearance().barTintColor = .black
        
//        tabBar.barTintColor = .black
//        tabBar.layer.opacity = 1
//        tabBar.layer.backgroundColor = CGColor(red: 0, green: 0 , blue: 0, alpha: 1)//       tabBar.backgroundColor = #colorLiteral(red: 0, green: 0.004083503969, blue: 0.003998307977, alpha: 1)
////        tabBar.tintColor = .white
//        tabBar.alpha = 1
    }
    
}
