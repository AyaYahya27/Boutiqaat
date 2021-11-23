//
//  AttributedButton.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation
import UIKit

class AttributedButton: UIButton{
    
    init(text: String, bold: Bool) {
        super.init(frame: .zero)
        let atts: [NSAttributedString.Key:Any]
        
        if bold{
            atts = [.foregroundColor: UIColor(white: 0, alpha: 1), .font: UIFont(name: "HelveticaNeue-Bold", size: 18)]
        } else{
            
            atts = [.foregroundColor: UIColor(white: 0, alpha: 1), .font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        }

        
        let attributedtitle = NSMutableAttributedString(string: "\(text) ", attributes: atts)
        
        setAttributedTitle(attributedtitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

