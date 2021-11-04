//
//  LoginViewController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//

import UIKit



class LoginViewController : NavigationView{
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    // function to set the UI view
    func configureUI(){
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
         navBarUI()
    }
    

    func navBarUI(){

        nav(color: .white, title: "LogIn")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(handleClose))

    }
    
   @objc func handleClose(){
       self.navigationController?.pushViewController(RegisterViewController(), animated: true)
       
    }
    
}
