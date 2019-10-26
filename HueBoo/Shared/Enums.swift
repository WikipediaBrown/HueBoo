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
        guard section < ColorCells.allCases.count else { return .zero }
        
        switch ColorCells.allCases[section] {
        case .colorScheme:
            return ColorScheme.allCases.count
        case .primary:
            return 1
        }
    }
    
    static func getCellSize(for indexPath: IndexPath) -> CGSize {
        guard indexPath.item < ColorCells.allCases.count else { return .zero }
        
        switch ColorCells.allCases[indexPath.section] {
        case .colorScheme:
            return Constants.CGSizes.colorSchemeCellSize
        case .primary:
            return Constants.CGSizes.primaryCellSize
        }
    }
    
    static func setupCell(with collrctionView: UICollectionView, and indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item < ColorCells.allCases.count else { return UICollectionViewCell() }
        
        switch ColorCells.allCases[indexPath.section] {
        case .colorScheme:
            return collrctionView.dequeueReusableCell(withReuseIdentifier: ColorSchemeCell.description(), for: indexPath)
        case .primary:
            return collrctionView.dequeueReusableCell(withReuseIdentifier: PrimaryCell.description(), for: indexPath)
        }
    }
}


enum ColorScheme: String, CaseIterable {
    case monochromatic = "Monochromatic"
    
    static func getScheme(from index: Int) -> ColorScheme? {
        guard index < ColorScheme.allCases.count else { return nil }
        return ColorScheme.allCases[index]
    }
}
