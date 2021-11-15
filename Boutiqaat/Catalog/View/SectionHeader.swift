//
//  SectionHeader.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 15/11/2021.
//

import UIKit

class Header : UICollectionReusableView{
    let label  = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Label"
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}