//
//  HueBooSnapshots.swift
//  HueBooSnapshots
//
//  Created by Wikipedia Brown on 9/24/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import XCTest

class HueBooSnapshots: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testSnapshots() {
        
        let cellOne = XCUIApplication().cells["New Hue Number 1"]
        guard cellOne.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        snapshot("Color 1")
        cellOne.tap()
        
        let cellTwo = XCUIApplication().cells["New Hue Number 2"]
        guard cellTwo.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        snapshot("Color 2")
        cellTwo.tap()
        
        let cellThree = XCUIApplication().cells["New Hue Number 3"]
        guard cellThree.waitForExistence(timeout: 5) == true else { XCTAssertTrue(false); return }
        snapshot("Color 3")
        cellThree.tap()
        
        snapshot("Color 4")
    }
}
