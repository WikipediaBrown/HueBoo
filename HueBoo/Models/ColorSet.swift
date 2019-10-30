//
//  ColorSet.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct ColorSet: Equatable {
    
    let hue: CGFloat
    let saturation: CGFloat
    let brightness: CGFloat
    let alpha: CGFloat
    
    var colorScheme: ColorScheme?
    
    init(initialColor: UIColor) {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 1
        initialColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
    
    init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat = 1) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
    
    func get(colorScheme: ColorScheme) -> [ColorSet] {
        switch colorScheme {
        case .analogous:
            return getAnalogousScheme()
        case .complementary:
            return getComplementaryScheme()
        case .monochromatic:
            return getMonochromaticScheme()
        case .splitComplementary:
            return getSplitComplimentary()
        case .triadic:
            return getTriadicScheme()
        case .tetradic:
            return getTetradicScheme()
        }
    }
    
    private func getAnalogousScheme() -> [ColorSet] {
        let arc: CGFloat = 1/12
        let colorOne = ColorSet(hue: getHue(-arc), saturation: saturation, brightness: brightness)
        let colorTwo = ColorSet(hue: getHue(arc), saturation: saturation, brightness: brightness)
        return [self, colorOne, colorTwo]
    }
    
    private func getComplementaryScheme() -> [ColorSet] {
        return [self, ColorSet(hue: getHue(0.5), saturation: saturation, brightness: brightness)]
    }
    
    private func getSplitComplimentary() -> [ColorSet] {
        let arc: CGFloat = 5/12
        let colorOne = ColorSet(hue: getHue(-arc), saturation: saturation, brightness: brightness)
        let colorTwo = ColorSet(hue: getHue(arc), saturation: saturation, brightness: brightness)
        return [self, colorOne, colorTwo]
    }
    
    private func getMonochromaticScheme() -> [ColorSet] {
        var colorSets: [ColorSet] = [self]
        for index in 1..<5 {
            let brightnessOffset = getBrightness(CGFloat(index) * 0.15)
            colorSets.append(ColorSet(hue: hue, saturation: saturation, brightness: brightnessOffset))
        }
        return colorSets
    }
    
    private func getTriadicScheme() -> [ColorSet] {
        let arc: CGFloat = 1/3
        let colorOne = ColorSet(hue: getHue(-arc), saturation: saturation, brightness: brightness)
        let colorTwo = ColorSet(hue: getHue(arc), saturation: saturation, brightness: brightness)
        return [self, colorOne, colorTwo]
    }
    
    private func getTetradicScheme() -> [ColorSet] {
        let colorOne: CGFloat = 12 / 12
        let colorTwo: CGFloat = 1 / 12
        let colorThree: CGFloat = 6 / 12
        let colorFour: CGFloat = 7 / 12
        
        let one = ColorSet(hue: getHue(colorOne), saturation: saturation, brightness: brightness)
        let two = ColorSet(hue: getHue(colorTwo), saturation: saturation, brightness: brightness)
        let three = ColorSet(hue: getHue(colorThree), saturation: saturation, brightness: brightness)
        let four = ColorSet(hue: getHue(colorFour), saturation: saturation, brightness: brightness)
        
        return [one, two, three, four]
    }
    
    private func getHue(_ offset: CGFloat) -> CGFloat {
        return (hue + offset).truncatingRemainder(dividingBy: 1)
    }
    
    private func getSaturation(_ offset: CGFloat) -> CGFloat {
        let threshold: CGFloat = 0.3
        let newSaturation = (saturation + offset).truncatingRemainder(dividingBy: 1)
        return newSaturation > threshold ? newSaturation : threshold
    }
    
    private func getBrightness(_ offset: CGFloat, _ floor: CGFloat = 0.2) -> CGFloat {
        let threshold: CGFloat = 0.2
        let newBrightness = (brightness + offset).truncatingRemainder(dividingBy: 1)
        return newBrightness > threshold ? newBrightness : threshold + offset
    }
    
}
