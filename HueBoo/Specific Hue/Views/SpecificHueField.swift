//
//  SpecificHueField.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 11/2/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class SpecificHueField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: Constants.CGFloats.primaryLabelFontSize)
        isAccessibilityElement = false
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
