//
//  RootCollectionView.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/15/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol RootCollectionViewListening: class {
    func onTap()
    func onDisplayCell(at indexPath: IndexPath) -> ColorSet?
    func onDisplayCount() -> Int?
    func onPage(at index: Int)
}

class RootCollectionView: UICollectionView {
    
    private let hueBooLabel = HueBooLabel()
    
    weak var listener: RootCollectionViewListening?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = Constants.CGSizes.screenSize
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        super.init(frame: .zero, collectionViewLayout: layout)
        setupViews()
        dataSource = self
        delegate = self
        isPagingEnabled = true
        register(RootCell.self, forCellWithReuseIdentifier: RootCell.description())
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func insertItem(at indexPath: IndexPath) {
        reloadData()
        scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
    private func setupViews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.type = .radial
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        addSubview(hueBooLabel)
        
        NSLayoutConstraint.activate([
            hueBooLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            hueBooLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -80),
            hueBooLabel.heightAnchor.constraint(equalToConstant: Constants.CGFloats.hueBooLogoHeight),
            hueBooLabel.widthAnchor.constraint(equalToConstant: Constants.CGFloats.hueBooLogoWidth)
        ])
        
//        hueBooLabel.transform = CGAffineTransform(rotationAngle: .pi / 4)
    }
    
}

extension RootCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listener?.onDisplayCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: RootCell.description(), for: indexPath)
    }
    
}

extension RootCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        switch cell {
        case let cell as RootCell:
            let colorSet = listener?.onDisplayCell(at: indexPath)
            cell.tag = indexPath.item
            cell.listener = self
            cell.updateColor(with: colorSet)
        default:
            break
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentIndex = scrollView.contentOffset.x / scrollView.frame.size.width
        guard currentIndex == floor(currentIndex) else { return }
        
        listener?.onPage(at: Int(currentIndex))
        
    }
    
}

extension RootCollectionView: RootCellListener {
    
    func onTap(at indexPath: IndexPath) {
        listener?.onTap()
    }
    
}
