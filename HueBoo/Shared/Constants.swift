//
//  Constants.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/14/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct Constants {
    struct Ints {
        static let numberOfColumns: Int = 1
    }
    struct CGFloats {
        static let heroCellHeight: CGFloat = UIScreen.main.bounds.height
        static let standardMargin: CGFloat = 8
        static let cellPadding: CGFloat = 6
        static let primaryLabelFontSize: CGFloat = 43
        static let hueBooLogoFontSize: CGFloat = 75
        static let hueBooLogoHeight: CGFloat = UIScreen.main.bounds.height
        static let hueBooLogoWidth: CGFloat = UIScreen.main.bounds.width
        static let colorSchemeCellHeight: CGFloat = UIScreen.main.bounds.width / 6
    }
    struct CGSizes {
        static let screenSize: CGSize = UIScreen.main.bounds.size
        static let primaryCellSize: CGSize = UIScreen.main.bounds.size
        static let colorSchemeCellSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: CGFloats.colorSchemeCellHeight)
        static let swapButtonSize: CGSize = CGSize(width: 44, height: 44)
    }
    struct Strings {
        static let currentExperience = "CurrentExperience"
        static let cannotParse: String = "Sorry, but we couldn't parse this color. We've already been notified so don't even trip dooooooog."
        static let queueName = "HueQueue"
    }
    
    static func getTextColor(from color: UIColor) -> UIColor {
        
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let luminescence = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  luminescence < 0.50 ? .white : .black
        
    }
}
