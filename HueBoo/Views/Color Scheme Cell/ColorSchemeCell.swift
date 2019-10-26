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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }
    
    private func setupViews() {
        
    }
    
}
