//
//  PhoneTextField.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//
import  UIKit

class PhoneTextField {
    
   let countryCodeLabel : UITextField = {
        let tf = UITextField()
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        tf.leftView = spacer
        tf.leftViewMode = .always
        tf.rightView = spacer
        tf.rightViewMode = .always
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = CGColor(gray: 0.5, alpha: 0.3)
        tf.backgroundColor = .white
        tf.isEnabled = false
        return tf
        
    }()
    
 let textField : NormalTextField
    
    let stack :  UIStackView
    
    init(placeholder: String, secure: Bool, countryCode : String){
        
        textField = NormalTextField(placeholder: placeholder, secure: secure)
        
        countryCodeLabel.text = countryCode
        
        stack = UIStackView(arrangedSubviews: [countryCodeLabel, textField])
        stack.axis = .horizontal
        stack.spacing = 0
        
    }
    
    func getView() -> UIStackView{
        return stack
    }
    
    func getMobileTextField() -> UITextField{
        return textField
    }
    
}
