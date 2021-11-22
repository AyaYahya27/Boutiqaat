//
//  SectionHeader.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 15/11/2021.
//

import UIKit

class Header : UICollectionReusableView{
   
    static let headerId = "headerIdentifier"

    var categoryName  = UILabel()
    
    let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "View All"
        label.textColor = #colorLiteral(red: 0.6721322536, green: 0.5807828307, blue: 0.1846646965, alpha: 1)
        return label
    }()

    let horizontalLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        view.setHeight(1)
        
        
    return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        label.text = "Label"
    
        addSubview(categoryName)
        categoryName.anchor(left: self.leftAnchor, paddingLeft: 5)
        
        addSubview(viewAllLabel)
        viewAllLabel.anchor(right: self.rightAnchor, paddingRight: 7)
//        backgroundColor = .systemPink
        
        addSubview(horizontalLine)
        horizontalLine.anchor(bottom: self.bottomAnchor, right: self.rightAnchor, paddingBottom: 7.5,paddingRight: 7)
    }
    
    func titleLabel(title: String, width: Double)
    {
        var lineWidth = 0.0
        categoryName.text = title
        lineWidth = Double(Int(UIScreen.main.bounds.width)) - width
        horizontalLine.setWidth(lineWidth)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
