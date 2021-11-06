//
//  CustomButton.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    init(color: UIColor, buttonTitle: String) {
        super.init(frame: .zero)
        
        backgroundColor = color
        //button.frame = CGRect(x: 50, y: 100, width: 200, height: 52)
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        setHeight(40)
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
