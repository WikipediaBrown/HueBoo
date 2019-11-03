//
//  SpecificHueViewController.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol SpecificHuePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SpecificHueViewController: UIViewController, SpecificHuePresentable, SpecificHueViewControllable {

    weak var listener: SpecificHuePresentableListener?
    
    private let hexField = SpecificHueField()
    private let rgbField = SpecificHueField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(hexField)
        view.addSubview(rgbField)
        
        NSLayoutConstraint.activate([
            hexField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hexField.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            hexField.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rgbField.topAnchor.constraint(equalTo: hexField.bottomAnchor, constant: Constants.CGFloats.cellPadding),
            rgbField.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            rgbField.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        
    }
}

extension SpecificHueViewController {
    private func toRGBString(from color: UIColor) -> String {
        
        let red = Int((CIColor(color: color).red * 255).rounded())
        let green = Int((CIColor(color: color).green * 255).rounded())
        let blue = Int((CIColor(color: color).blue * 255).rounded())
        
        return  String("rgb(\(red), \(green), \(blue))")
        
    }
    
    private func toHexString(from color: UIColor) -> String {
        
        guard
            let components = color.cgColor.components,
            components.count >= 3
            else { return Constants.Strings.cannotParse }
        
        var unroundedRed = components[0]
        var unroundedGreen = components[1]
        var unroundedBlue = components[2]
        var unroundedAlpha: CGFloat = 1
        
        guard
            color.getRed(&unroundedRed, green: &unroundedGreen, blue: &unroundedBlue, alpha: &unroundedAlpha) == true
            else { return Constants.Strings.cannotParse }
        
        let red: Int = lroundf(Float(unroundedRed) * 255)
        let green: Int = lroundf(Float(unroundedGreen) * 255)
        let blue: Int = lroundf(Float(unroundedBlue) * 255)
        
        return String(format: "#%02lX%02lX%02lX", red, green, blue)
        
    }
    
}
