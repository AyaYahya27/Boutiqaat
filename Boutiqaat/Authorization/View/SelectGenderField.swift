//
//  SelectGenderField.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 28/10/2021.
//
import  UIKit

class SelectGenderField : UIButton{
    
    init(buttons : [UIButton]) {
        super.init(frame: .zero)
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.spacing = 0
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
