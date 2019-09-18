//
//  PrimaryLabel.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/16/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class PrimaryLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: Constants.CGFloats.primaryLabelFontSize)
        numberOfLines = 0
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
