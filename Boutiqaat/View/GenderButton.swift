//
//  GenderButton.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 30/10/2021.
//
 

import UIKit

class GenderButton: UIButton{
    
    var id : String = "ghazal"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setButtonUI (placeholder : String, id : String){
        self.id = id
        setTitle("  " + placeholder, for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setHeight(40)
        layer.borderWidth = 1
        layer.borderColor = CGColor(gray: 0.5, alpha: 0.3)
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        isEnabled = true
    }
    
    func selected(){
        setImage(UIImage(systemName: "checkmark"), for: .normal)
        tintColor = #colorLiteral(red: 0.6842647791, green: 0.575599134, blue: 0.2034798861, alpha: 1)
        setTitleColor(#colorLiteral(red: 0.6842647791, green: 0.575599134, blue: 0.2034798861, alpha: 1), for: .normal)
    }
    func unSelected (){
        setImage(nil, for: .normal)
        tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTitleColor(.black, for: .normal)
    }
    
}
