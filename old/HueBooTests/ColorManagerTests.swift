//
//  ColorManagerTests.swift
//  HueBooTests
//
//  Created by Wikipedia Brown on 9/18/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import XCTest
@testable import HueBoo

class ColorManagerTests: XCTestCase {
    
    func test_colorManager_onGetRandomColor_returnsRandomColorSet() {
        // Arrange
        let colorManager = ColorManager()
        // Act
        let colorOne = colorManager.getRandomColor()
        let colorTwo = colorManager.getRandomColor()
        // Assert
        XCTAssertNotEqual(colorOne, colorTwo, "Generated colorSet isn't random.")
    }

}
