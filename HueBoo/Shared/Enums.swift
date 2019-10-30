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
        guard indexPath.section < ColorCells.allCases.count else { return .zero }
        
        switch ColorCells.allCases[indexPath.section] {
        case .colorScheme:
            return Constants.CGSizes.colorSchemeCellSize
        case .primary:
            return Constants.CGSizes.primaryCellSize
        }
    }
    
    static func setupCell(with collrctionView: UICollectionView, and indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.section < ColorCells.allCases.count else { return UICollectionViewCell() }
        
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
    case complementary = "Complementary"
    case splitComplementary = "Split Complementary"
    case analogous = "Analogous"
    case triadic = "Triadic"
    case tetradic = "Tetradic"

    static func getScheme(from index: Int) -> ColorScheme? {
        guard index < ColorScheme.allCases.count else { return nil }
        return ColorScheme.allCases[index]
    }
}

enum ColorApproximation {
    case red
    case orange
    case yellow
    case green
    case blue
    case indigo
    case violet
}

enum Experience: CaseIterable {
    case randomHue
    case specificHue
    
    static func returnCase(from int: Int) -> Experience {
        guard int < Experience.allCases.count else { return .randomHue }
        return Experience.allCases[int]
    }
    
    static func returnIndex(from experience: Experience) -> Int {
        return Experience.allCases.firstIndex(of: experience) ?? 0
    }
}
