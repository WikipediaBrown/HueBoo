//
//  ColorSchemeCell.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/25/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

class ColorSchemeCell: UICollectionViewCell, ColorSetDisplayable {
    
    private let schemeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let schemeView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(colorSet: ColorSet?, as colorScheme: ColorScheme?) {
        guard let colorSet = colorSet, let colorScheme = colorScheme else { return }
        resetCell()
        schemeLabel.text = colorScheme.rawValue
        add(colors: colorSet.get(colorScheme: colorScheme))
    }
    
    private func add(colors colorSets: [ColorSet]) {
        for colorSet in colorSets {
            let hue = colorSet.hue
            let saturation = colorSet.saturation
            let brightness = colorSet.brightness
            let alpha = colorSet.alpha
            let view = UIView()
            view.backgroundColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            schemeView.addArrangedSubview(view)
        }
    }
    
    private func resetCell() {
        schemeLabel.text = nil
        for view in schemeView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func setupViews() {
        backgroundColor = .white

        addSubview(schemeLabel)
        addSubview(schemeView)
        
        NSLayoutConstraint.activate([
            schemeLabel.topAnchor.constraint(equalTo: topAnchor),
            schemeLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            schemeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            schemeLabel.widthAnchor.constraint(equalToConstant: (Constants.CGFloats.colorSchemeCellHeight * 2) - 12)
        ])

        NSLayoutConstraint.activate([
            schemeView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            schemeView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            schemeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            schemeView.widthAnchor.constraint(equalToConstant: (Constants.CGFloats.colorSchemeCellHeight * 4) - 12)
        ])
        
    }
}
