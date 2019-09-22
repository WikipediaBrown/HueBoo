//
//  HueBooLogo.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/21/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class HueBooLogo: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont(name: "Chalkduster", size: Constants.CGFloats.hueBooLogoFontSize)
        numberOfLines = 1
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
