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

class RootCell: UICollectionViewCell, PrimaryCellListener {
        
    weak var listener: RootCellListener?
    
    private let collectionView = PrimaryCollectionView()
    private var colorSet: ColorSet?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateColor(with colorSet: ColorSet?) {
        self.colorSet = colorSet
        collectionView.reloadData()
    }
    
    func cellTapped() {
        let indexPath = IndexPath(item: tag, section: 0)
        listener?.onTap(at: indexPath)
    }
    
    private func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        
    }
}

extension RootCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ColorCells.getCellCount(from: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ColorCells.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ColorCells.setupCell(with: collectionView, and: indexPath)
        switch cell {
        case let cell as PrimaryCell:
            cell.listener = self
        default:
            break
        }
        return cell
    }
}

extension RootCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ColorSetDisplayable else { return }
        colorSet?.colorScheme = ColorScheme.getScheme(from: indexPath.item)
        cell.display(colorSet: colorSet)
    }
}

extension RootCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return ColorCells.getCellSize(for: indexPath)
    }
}
