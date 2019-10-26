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
    private let hueBooLabel = HueBooLabel()

    private var statusBarStyle: UIStatusBarStyle?
    
    weak var listener: RootPresentableListener?
    
    var hasAppeared: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showFirstItem()
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
        if hueBooLabel.alpha != 0 {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.hueBooLabel.alpha = 0
            }
        }
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

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.type = .radial
        
        view.layer.insertSublayer(gradientLayer, at: 0)

        collectionView.listener = self
        collectionView.backgroundColor = .clear
        
        view.addSubview(hueBooLabel)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hueBooLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hueBooLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 25),
            hueBooLabel.heightAnchor.constraint(equalToConstant: Constants.CGFloats.hueBooLogoHeight),
            hueBooLabel.widthAnchor.constraint(equalToConstant: Constants.CGFloats.hueBooLogoWidth)
        ])
        
    }
    
    private func showFirstItem() {
        if hasAppeared == false {
            hasAppeared = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                self?.listener?.onHeroTile()
            }
        }
    }
    
}

