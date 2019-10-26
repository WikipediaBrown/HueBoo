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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryCell.description(), for: indexPath)
            if let cell = cell as? PrimaryCell {
                cell.listener = self
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension RootCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ColorSetDisplayable else { return }
        cell.display(colorSet: colorSet)
    }
}
