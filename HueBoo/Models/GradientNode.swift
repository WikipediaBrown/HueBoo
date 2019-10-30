//
//  GradientNode.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class GradientNode {
    var color: CGColor
    var next: GradientNode?
    
    init(with colorApproximation: ColorApproximation) {
        
        color = UIColor.clear.cgColor
        switch colorApproximation {
        case .red:
            color = createRed()
        case .orange:
            color = createOrange()
        case .yellow:
            color = createYellow()
        case .green:
            color = createGreen()
        case .blue:
            color = createBlue()
        case .indigo:
            color = createIndigo()
        case .violet:
            color = createViolet()
        }

    }
    
    private func createRed() -> CGColor {
        let red = CGFloat.random(in: 220..<256) / 255
        let green = CGFloat.random(in: 120..<220) / 255
        let blue = CGFloat.random(in: 120..<220) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createOrange() -> CGColor {
        let red = CGFloat.random(in: 220..<256) / 255
        let green = CGFloat.random(in: 220..<256) / 255
        let blue = CGFloat.random(in: 120..<220) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createYellow() -> CGColor {
        let red = CGFloat.random(in: 220..<256) / 255
        let green = CGFloat.random(in: 220..<256) / 255
        let blue = CGFloat.random(in: 120..<220) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createGreen() -> CGColor {
        let red = CGFloat.random(in: 120..<256) / 255
        let green = CGFloat.random(in: 220..<256) / 255
        let blue = CGFloat.random(in: 120..<220) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createBlue() -> CGColor {
        let red = CGFloat.random(in: 120..<220) / 255
        let green = CGFloat.random(in: 120..<220) / 255
        let blue = CGFloat.random(in: 220..<256) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createIndigo() -> CGColor {
        let red = CGFloat.random(in: 220..<256) / 255
        let green = CGFloat.random(in: 120..<220) / 255
        let blue = CGFloat.random(in: 220..<256) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
    
    private func createViolet() -> CGColor {
        let red = CGFloat.random(in: 250..<256) / 255
        let green = CGFloat.random(in: 120..<220) / 255
        let blue = CGFloat.random(in: 250..<256) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
    }
}
