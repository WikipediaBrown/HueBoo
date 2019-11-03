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
    func onRandomHue()
}

final class SpecificHueViewController: UIViewController, SpecificHuePresentable, SpecificHueViewControllable {

    weak var listener: SpecificHuePresentableListener?
    
    private let hexField = SpecificHueHexField()
    private let rgbField = SpecificHueRGBField()
    
    private let randomHueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @objc
    func randomHueButtonTapped() {
        listener?.onRandomHue()
    }
    
    private func setupViews() {
        
        let buttonSize: CGSize = Constants.CGSizes.swapButtonSize
        
        randomHueButton.addTarget(self, action: #selector(randomHueButtonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        view.addSubview(hexField)
        view.addSubview(randomHueButton)
        view.addSubview(rgbField)
        
        hexField.delegate = self
        hexField.backgroundColor = .green

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
        
        NSLayoutConstraint.activate([
             randomHueButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             randomHueButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
             randomHueButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
             randomHueButton.widthAnchor.constraint(equalToConstant: buttonSize.width)
         ])
        
    }
}

extension SpecificHueViewController: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case is SpecificHueHexField:
            guard string != "#" else { return false }

            guard let textField = textField as? SpecificHueHexField else {return false}
            var hexString = textField.hexString
            
            if string == "" {
                
                hexString.replacingCharacters(in: range, with: string)
                                
            } else {
                
            }
            
        case is SpecificHueRGBField:
            print(textField.description)
        default:
            break
        }
        
        print("The range is \(range.location)")
        print("The string is \(string)")
        return true
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
