//
//  HueBooUITests.swift
//  HueBooUITests
//
//  Created by Wikipedia Brown on 9/24/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import XCTest

class HueBooUITests: XCTestCase {

    override func setUp() {
        XCUIApplication().launch()
        continueAfterFailure = false
    }

    func test_onTap_addsNewHue() {

        let cellOne = XCUIApplication().cells["New Hue Number 1"]
        guard cellOne.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        cellOne.tap()
        
        let cellTwo = XCUIApplication().cells["New Hue Number 2"]
        guard cellTwo.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        cellTwo.tap()
        
        let cellThree = XCUIApplication().cells["New Hue Number 3"]
        guard cellThree.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        cellThree.tap()
        
    }
    
}
