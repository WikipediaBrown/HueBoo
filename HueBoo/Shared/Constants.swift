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
        static let hueBooLogoFontSize: CGFloat = 43
    }
    struct CGSizes {
        static let screenSize: CGSize = UIScreen.main.bounds.size
    }
    struct Strings {
        static let cannotParse: String = "Sorry, but we couldn't parse this color. We've already been notified so don't even trip dooooooog."
    }
    
    static func getTextColor(from color: UIColor) -> UIColor {
        
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let luminescence = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  luminescence < 0.50 ? .white : .black
        
    }
}
