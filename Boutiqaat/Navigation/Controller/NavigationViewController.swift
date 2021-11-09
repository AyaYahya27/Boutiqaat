//
//  NavigationView.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//

import UIKit

class NavigationViewController : UITableViewController{
 
    
    
    func nav(color : UIColor , title: String){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = color
        let navigationFont = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 22), size: 22 )
        appearance.titleTextAttributes = [ .foregroundColor: UIColor.black, .font: navigationFont]
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.title = title
      navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
   
   
}
