////
////  RootInteractor.swift
////  HueBoo
////
////  Created by Wikipedia Brown on 9/4/19.
////  Copyright © 2019 IamGoodBad. All rights reserved.
////
//
//import Foundation
//
//protocol bRootPresentable: class {
//    var listener: RootPresentableListener? { get set }
//    func insertColorSet(at indexPath: IndexPath)
//}
//
//class bRootInteractor: RootPresentableListener {
//    
//    let presenter: bRootPresentable
//    
//    private let colorManager: ColorManaging
//    
//    private var colorSetList: [ColorSet] = []
//    
//    init(presenter: bRootPresentable, colorManager: ColorManaging) {
//        self.colorManager = colorManager
//        self.presenter = presenter
//        presenter.listener = self
//    }
//    
//    func onHeroTile() {
//        let indexPath = IndexPath(item: colorSetList.count, section: 0)
//        let colorSet = colorManager.getRandomColor()
//        colorSetList.append(colorSet)
//        presenter.insertColorSet(at: indexPath)
//    }
//    
//    func colorSet(at indexPath: IndexPath) -> ColorSet? {
//        guard indexPath.item < colorSetList.count else { return nil }
//        return colorSetList[indexPath.item]
//    }
//    
//    func onCountRequest() -> Int {
//        return colorSetList.count
//    }
//    
//}
//
