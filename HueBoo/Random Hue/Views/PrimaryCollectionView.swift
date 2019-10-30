//
//  PrimaryCollectionView.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/25/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol ColorSetDisplayable {
    func display(colorSet: ColorSet?, as colorScheme: ColorScheme?)
}

extension ColorSetDisplayable {
    func display(colorSet: ColorSet?, as colorScheme: ColorScheme? = nil) {}
}

class PrimaryCollectionView: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        contentInsetAdjustmentBehavior = .never
        isPagingEnabled = true
        register(PrimaryCell.self, forCellWithReuseIdentifier: PrimaryCell.description())
        register(ColorSchemeCell.self, forCellWithReuseIdentifier: ColorSchemeCell.description())
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
