//
//  PasswordTextField.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//
import  UIKit

class PasswordTextField : NormalTextField{
    
    
    
     
    
    override init(placeholder: String, secure: Bool) {
        super.init(placeholder: placeholder, secure: secure)
        isSecureTextEntry = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



