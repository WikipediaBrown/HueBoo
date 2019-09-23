//
//  RootViewController.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/4/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

protocol RootPresentableListener: class {
    func onHeroTile()
    func colorSet(at indexPath: IndexPath) -> ColorSet?
    func onCountRequest() -> Int
}

class RootViewController: UIViewController, RootPresentable, RootCollectionViewListening {
    
    private let collectionView: RootCollectionView = RootCollectionView()
    
    private var statusBarStyle: UIStatusBarStyle?
    
    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listener?.onHeroTile()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle ?? UIStatusBarStyle.lightContent
    }
    
    func insertColorSet(at indexPath: IndexPath) {
        collectionView.insertItem(at: indexPath)
        onPage(at: indexPath.item)
    }
    
    func onDisplayCell(at indexPath: IndexPath) -> ColorSet? {
        return listener?.colorSet(at: indexPath)
    }
    
    func onDisplayCount() -> Int? {
        return listener?.onCountRequest()
    }
    
    func onTap() {
        listener?.onHeroTile()
    }
    
    func onPage(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        guard let colorSet = listener?.colorSet(at: indexPath) else { return }
        let color = UIColor(hue: colorSet.hue, saturation: colorSet.saturation, brightness: colorSet.brightness, alpha: colorSet.alpha)
        if Constants.getTextColor(from: color) == .white {
            statusBarStyle = .lightContent
        } else {
            statusBarStyle = .default
        }
        
        UIView.animate(withDuration: 0.3) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    private func setupViews() {

        collectionView.listener = self
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
    }
    
}

