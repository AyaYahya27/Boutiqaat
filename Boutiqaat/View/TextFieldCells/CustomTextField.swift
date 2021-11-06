//
//  CustomTextField.swift
//  LoginBoutiqaat
//
//  Created by Ghazal Adnan on 28/10/2021.
//
import UIKit

class CustomTextField: UITextField{
    
    init(placeholder: String, icon: String) {
        super.init(frame: .zero)
        

        

        textContentType = .oneTimeCode
        borderStyle = .roundedRect
        textColor = .black
        backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        setHeight(40)
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor: #colorLiteral(red: 0.8469936252, green: 0.8470956683, blue: 0.8469588161, alpha: 1)])
        
        let padding = 8
        let size = 20

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        let image = UIImage(systemName: icon)
        iconView.image = image
        iconView.tintColor = .gray
        outerView.addSubview(iconView)
        leftView = outerView
        leftViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDismissWarning(){
        print("presssed")
    }
}


