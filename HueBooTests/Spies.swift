//
//  Spies.swift
//  HueBooTests
//
//  Created by Wikipedia Brown on 9/17/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit
@testable import HueBoo

class ColorManagerSpy: ColorManaging {
    var invokedGetRandomColor = false
    var invokedGetRandomColorCount = 0
    var stubbedGetRandomColorResult: ColorSet!
    func getRandomColor() -> ColorSet {
        invokedGetRandomColor = true
        invokedGetRandomColorCount += 1
        return stubbedGetRandomColorResult
    }
}

class RootInteractorSpy: RootPresentableListener {
    var invokedOnHeroTile = false
    var invokedOnHeroTileCount = 0
    func onHeroTile() {
        invokedOnHeroTile = true
        invokedOnHeroTileCount += 1
    }
    var invokedColorSet = false
    var invokedColorSetCount = 0
    var invokedColorSetParameters: (indexPath: IndexPath, Void)?
    var invokedColorSetParametersList = [(indexPath: IndexPath, Void)]()
    var stubbedColorSetResult: ColorSet!
    func colorSet(at indexPath: IndexPath) -> ColorSet? {
        invokedColorSet = true
        invokedColorSetCount += 1
        invokedColorSetParameters = (indexPath, ())
        invokedColorSetParametersList.append((indexPath, ()))
        return stubbedColorSetResult
    }
    var invokedOnCountRequest = false
    var invokedOnCountRequestCount = 0
    var stubbedOnCountRequestResult: Int! = 0
    func onCountRequest() -> Int {
        invokedOnCountRequest = true
        invokedOnCountRequestCount += 1
        return stubbedOnCountRequestResult
    }
}

class RootViewControllerSpy: RootPresentable, RootCollectionViewListening {
    var invokedListenerSetter = false
    var invokedListenerSetterCount = 0
    var invokedListener: RootPresentableListener?
    var invokedListenerList = [RootPresentableListener?]()
    var invokedListenerGetter = false
    var invokedListenerGetterCount = 0
    var stubbedListener: RootPresentableListener!
    var listener: RootPresentableListener? {
        set {
            invokedListenerSetter = true
            invokedListenerSetterCount += 1
            invokedListener = newValue
            invokedListenerList.append(newValue)
        }
        get {
            invokedListenerGetter = true
            invokedListenerGetterCount += 1
            return stubbedListener
        }
    }
    var invokedInsertColorSet = false
    var invokedInsertColorSetCount = 0
    var invokedInsertColorSetParameters: (indexPath: IndexPath, Void)?
    var invokedInsertColorSetParametersList = [(indexPath: IndexPath, Void)]()
    func insertColorSet(at indexPath: IndexPath) {
        invokedInsertColorSet = true
        invokedInsertColorSetCount += 1
        invokedInsertColorSetParameters = (indexPath, ())
        invokedInsertColorSetParametersList.append((indexPath, ()))
    }
    var invokedOnTap = false
    var invokedOnTapCount = 0
    func onTap() {
        invokedOnTap = true
        invokedOnTapCount += 1
    }
    var invokedOnDisplayCell = false
    var invokedOnDisplayCellCount = 0
    var invokedOnDisplayCellParameters: (indexPath: IndexPath, Void)?
    var invokedOnDisplayCellParametersList = [(indexPath: IndexPath, Void)]()
    var stubbedOnDisplayCellResult: ColorSet!
    func onDisplayCell(at indexPath: IndexPath) -> ColorSet? {
        invokedOnDisplayCell = true
        invokedOnDisplayCellCount += 1
        invokedOnDisplayCellParameters = (indexPath, ())
        invokedOnDisplayCellParametersList.append((indexPath, ()))
        return stubbedOnDisplayCellResult
    }
    var invokedOnDisplayCount = false
    var invokedOnDisplayCountCount = 0
    var stubbedOnDisplayCountResult: Int!
    func onDisplayCount() -> Int? {
        invokedOnDisplayCount = true
        invokedOnDisplayCountCount += 1
        return stubbedOnDisplayCountResult
    }
    var invokedOnPage = false
    var invokedOnPageCount = 0
    var invokedOnPageParameters: (index: Int, Void)?
    var invokedOnPageParametersList = [(index: Int, Void)]()
    func onPage(at index: Int) {
        invokedOnPage = true
        invokedOnPageCount += 1
        invokedOnPageParameters = (index, ())
        invokedOnPageParametersList.append((index, ()))
    }
}
