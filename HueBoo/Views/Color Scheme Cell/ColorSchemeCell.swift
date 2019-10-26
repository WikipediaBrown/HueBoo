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
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.minimumScaleFactor = 0.01
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.numberOfLines = 0
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
    
    func display(colorSet: ColorSet?) {
        guard let colorSet = colorSet else { return }
        resetCell()
        schemeLabel.text = colorSet.colorScheme?.rawValue
        add(colors: colorSet.getColorScheme())
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
            schemeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            schemeLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            schemeLabel.widthAnchor.constraint(equalToConstant: (Constants.CGFloats.colorSchemeCellHeight * 2) - 12)
        ])
        
        NSLayoutConstraint.activate([
            schemeView.topAnchor.constraint(equalTo: topAnchor),
            schemeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            schemeView.rightAnchor.constraint(equalTo: rightAnchor),
            schemeView.widthAnchor.constraint(equalToConstant: Constants.CGFloats.colorSchemeCellHeight * 4)
        ])
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
    
}
