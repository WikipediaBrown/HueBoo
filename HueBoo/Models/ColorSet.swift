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
    
}
