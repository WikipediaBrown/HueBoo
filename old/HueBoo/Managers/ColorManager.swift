//
//  ColorManager.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/10/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol ColorManaging: class {
    func getRandomColor() -> ColorSet
    func getColorSetFromRGB(rgSbtring: String?) -> ColorSet?
    func getColorSetFromHex(hexString: String?) -> ColorSet?
    func getHexFromRGB(rgbString: String) -> String?
    func getRGBFromHex(hexString: String) -> String?
}

class ColorManager: ColorManaging {
    
    func getColorSetFromHex(hexString: String?) -> ColorSet? {
        ColorSet(initialColor: .cyan)
    }
    
    func getColorSetFromRGB(rgSbtring: String?) -> ColorSet? {
        ColorSet(initialColor: .red)
    }
    
    func getHexFromRGB(rgbString: String) -> String? {
        let red = 0
        let green = 0
        let blue = 0
        
        let redString = String(format:"%02X", red)
        let greenString = String(format:"%02X", green)
        let blueString = String(format:"%02X", blue)
        
        return redString + greenString + blueString
    }
    
    func getRandomColor() -> ColorSet {
        let hue = CGFloat.random(in: 0...1)
        let saturation = CGFloat.random(in: 0...1)
        let brightness = CGFloat.random(in: 0.1...1)
        return ColorSet(hue: hue, saturation: saturation, brightness: brightness)
    }

    func getRGBFromHex(hexString: String) -> String? {
        return nil
    }
    
    private func hexValidation(hexString: String?) -> String? {
        guard
            let string = hexString,
            let regEx = try? NSRegularExpression(pattern: Constants.Strings.hexRegEX),
            let result = regEx.matches(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)).last,
            let range = Range(result.range, in: string)
        else { return nil }
                
        return ""//string[range]
    }
    
}
