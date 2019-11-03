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
    
    func getRandomColor() -> ColorSet {
        
        let hue = CGFloat.random(in: 0...1)
        let saturation = CGFloat.random(in: 0...1)
        let brightness = CGFloat.random(in: 0.1...1)
        return ColorSet(hue: hue, saturation: saturation, brightness: brightness)
        
    }
    
    func getColorSetFromHex(hexString: String?) -> ColorSet? {
        return ColorSet(initialColor: .red)
    }
    
    func getColorSetFromRGB(rgSbtring: String?) -> ColorSet? {
        return ColorSet(initialColor: .blue)
    }
    
    func getHexFromRGB(rgbString: String) -> String? {
        return nil
    }
    
    func getRGBFromHex(hexString: String) -> String? {
        return nil
    }
    
    private func hexValidation(hexString: String) {
        guard
            let substring = hexString.split(separator: "#").last,
            (substring.count == 4 || substring.count == 7)
        else { return }
        
        let string = String(substring)

        
    }
    
}
