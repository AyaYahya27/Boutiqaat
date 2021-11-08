//
//  NavigationView.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//

import UIKit

class NavigationView : UIViewController{
 
     let loadingSpinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = .white
        return spinner
    }()
    
     let  popUp: PopUpView = {
        let pop = PopUpView()
        return pop
    }()
    
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
    
    func showSpinner(button: UIButton){
        button.addSubview(loadingSpinner)
        loadingSpinner.startAnimating()
        loadingSpinner.centerX(inView: button)
        loadingSpinner.centerY(inView: button)
        button.setTitle("", for: .normal)
    }
    
    func hideSpinner(button: UIButton,title: String ){
        loadingSpinner.removeFromSuperview()
        
        loadingSpinner.stopAnimating()
   
        button.setTitle(title, for: .normal)
    }
    
    func openPopUp(error : String){
        popUp.errorLabel.text = error
        popUp.okButton.addTarget(self, action: #selector(self.closePopUp), for: .touchUpInside)
        view.addSubview(popUp.view)
        return
    }
    
    @objc func closePopUp(){
        popUp.view.removeFromSuperview()
    }
    
   
}
