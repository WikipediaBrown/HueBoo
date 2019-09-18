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
}

class ColorManager: ColorManaging {
    
    func getRandomColor() -> ColorSet {
        
        let hue = CGFloat.random(in: 0...1)
        let saturation = CGFloat.random(in: 0...1)
        let brightness = CGFloat.random(in: 0.1...1)
        return ColorSet(hue: hue, saturation: saturation, brightness: brightness)
        
    }
    
}
