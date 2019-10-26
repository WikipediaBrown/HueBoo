//
//  Enums.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/25/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

enum ColorCells: CaseIterable {
    case primary
    case colorScheme
    
    static func getCellCount(from section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return ColorScheme.allCases.count
        default:
            return 0
        }
    }
    
    static func setupCell(with collrctionView: UICollectionView, and indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < ColorCells.allCases.count else { return }
        
        switch ColorCells.allCases[indexPath.section] {
        case .primary:
            return collrctionView.dequeueReusableCell(withReuseIdentifier: PrimaryCell.description(), for: indexPath)
        case .colorScheme:
            return collrctionView.dequeueReusableCell(withReuseIdentifier: ColorSchemeCell.description(), for: indexPath)
        }
    }
}


enum ColorScheme: CaseIterable {
    case monochromatic
}
