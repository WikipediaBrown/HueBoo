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
    
    func getColorSetFromRGB(rgSbtring: String?) -> ColorSet? {
        return ColorSet(initialColor: .blue)
    }

    func getRGBFromHex(hexString: String) -> String? {
        return nil
    }
    
    private func hexValidation(hexString: String?) -> String? {
        guard
            let substring = hexString?.split(separator: "#").last,
            let regEx = try? NSRegularExpression(pattern: Constants.Strings.hexRegEX),
            (substring.count == 4 || substring.count == 7)
        else { return nil }
        
        let string = String(substring)
        let range = NSRange(location: 0, length: string.utf16.count)

        let this = regEx.matches(in: string, options: [], range: range).last
        
        return "regEx.matches(in: string, options: [], range: range).last"
    }
    
}
