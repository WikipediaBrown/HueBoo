//
//  HeroCell.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/4/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol RootCellListener: class {
    func onTap(at indexPath: IndexPath)
}

class RootCell: UICollectionViewCell {
    
    private let hexLabel = PrimaryLabel()
    private let rgbLabel = PrimaryLabel()
    
    weak var listener: RootCellListener?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateColor(with colorSet: ColorSet?) {
        guard let colorSet = colorSet else { return }
        let color = UIColor(hue: colorSet.hue, saturation: colorSet.saturation, brightness: colorSet.brightness, alpha: colorSet.alpha)
        let textColor = Constants.getTextColor(from: color)
        let hexString = toHexString(from: color)
        let rgbString = toRGBString(from: color)
        backgroundColor = color
        hexLabel.textColor = textColor
        hexLabel.text = hexString
        rgbLabel.textColor = textColor
        rgbLabel.text = rgbString
        updateAccessiblility(withHex: hexString, andRGB: rgbString)
    }
    
    @objc
    func cellTapped() {
        let indexPath = IndexPath(item: tag, section: 0)
        listener?.onTap(at: indexPath)
    }
    
    private func setupViews() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(tap)
        addSubview(hexLabel)
        addSubview(rgbLabel)
        NSLayoutConstraint.activate([
            hexLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hexLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            hexLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            rgbLabel.topAnchor.constraint(equalTo: hexLabel.bottomAnchor, constant: Constants.CGFloats.cellPadding),
            rgbLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            rgbLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            ])
    }
    
    private func updateAccessiblility(withHex hexString: String, andRGB rgbString: String) {
        accessibilityTraits = .button
        accessibilityLabel = "New Hue Number \(tag + 1)"
        accessibilityValue = "Hexidecimal value is \(hexString) and the RGB value is \(rgbString)"
        isAccessibilityElement = true
    }
    
}

extension RootCell {
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
