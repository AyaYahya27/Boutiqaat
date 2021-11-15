//
//  TabBraView.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//
//
import UIKit

class TabBarViewController: UITabBarController{

    func tab(color : UIColor , tintColor: UIColor){
       let appearance = UITabBarAppearance()
        appearance.backgroundColor = color
        tabBar.tintColor = tintColor
        tabBar.standardAppearance = appearance
        tabBar.backgroundColor = .black
    }
      
}
