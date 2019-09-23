//
//  HueBooLabel.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/21/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class HueBooLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Chalkduster", size: Constants.CGFloats.hueBooLogoFontSize)
        numberOfLines = 1
        text = "HueBoo"
        textAlignment = .center
        textColor = .white
        transform = CGAffineTransform(rotationAngle: .pi / -4)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
