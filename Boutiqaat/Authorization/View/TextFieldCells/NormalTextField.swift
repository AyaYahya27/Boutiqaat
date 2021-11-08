//
//  NormalTextField.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//
import  UIKit

class NormalTextField : UITextField{
    
    
    
    init(placeholder: String, secure : Bool ) {
        super.init(frame: .zero)
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        textContentType = .oneTimeCode
        layer.borderWidth = 0.5
        textColor = .black
        setHeight(45)
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.8)
        layer.borderColor = CGColor(gray: 0.5, alpha: 0.3)
        let font = UIFont(descriptor: UIFontDescriptor(name: RegisterConstants.navTitleFont, size: 15), size: 15 )
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 0.5, alpha: 0.5), .font :font , .backgroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1)])
        
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: self.frame.width - 50 , y: 0, width: 50, height: 44)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



