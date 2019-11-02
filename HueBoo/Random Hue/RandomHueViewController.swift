//
//  RandomHueViewController.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 10/29/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RandomHuePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func onHeroTile()
    func colorSet(at indexPath: IndexPath) -> ColorSet?
    func onCountRequest() -> Int
}

final class RandomHueViewController: UIViewController, RandomHuePresentable, RandomHueViewControllable, RootCollectionViewListening {

    weak var listener: RandomHuePresentableListener?
            
    private let collectionView: RootCollectionView = RootCollectionView()
    
    private var statusBarStyle: UIStatusBarStyle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        update()
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
        
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
        
    }
    
    private func update() {
        
        guard collectionView.numberOfItems(inSection: 0) > 0 else { return }
        
        collectionView.setNeedsLayout()
        collectionView.layoutIfNeeded()
        
        let index = collectionView.numberOfItems(inSection: 0) - 1
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: false)
        
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
