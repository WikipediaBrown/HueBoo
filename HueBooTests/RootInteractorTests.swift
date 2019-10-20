//
//  RootInteractorTests.swift
//  HueBooTests
//
//  Created by Wikipedia Brown on 9/17/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import XCTest
@testable import HueBoo

class RootInteractorTests: XCTestCase {
    
    func test_onHeroTile_invokedInsertColorSet_on_presenter() {
        // Arrange
        let presenter = RootViewControllerSpy()
        let colorManager = ColorManagerSpy()
        colorManager.stubbedGetRandomColorResult = Fixtures.colorSetFixturePurple
        let interactor = RootInteractor(presenter: presenter, colorManager: colorManager)
        // Act
        interactor.onHeroTile()
        // Assert
        XCTAssertTrue(presenter.invokedInsertColorSet, "Did not invoke insertColorSet.")
    }
    
    func test_colorSet_returnsColorSet() {
        // Arrange
        let presenter = RootViewControllerSpy()
        let colorManager = ColorManagerSpy()
        colorManager.stubbedGetRandomColorResult = Fixtures.colorSetFixturePurple
        let interactor = RootInteractor(presenter: presenter, colorManager: colorManager)
        // Act
        interactor.onHeroTile()
        let colorSet = interactor.colorSet(at: IndexPath(item: 0, section: 0))
        // Assert
        XCTAssertNotNil(colorSet, "Did not return colorSet.")
    }
    
    func test_onCountRequest_returnsCorrectCount() {
        // Arrange
        let presenter = RootViewControllerSpy()
        let colorManager = ColorManagerSpy()
        colorManager.stubbedGetRandomColorResult = Fixtures.colorSetFixturePurple
        let interactor = RootInteractor(presenter: presenter, colorManager: colorManager)
        // Act
        interactor.onHeroTile()
        // Assert
        XCTAssertEqual(interactor.onCountRequest(), 1, "Did not add only one color.")
    }
    
}
