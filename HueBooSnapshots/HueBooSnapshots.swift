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
        
        let element = XCUIApplication().collectionViews.cells.children(matching: .other).element
        element.tap()
        element.tap()
        element.tap()
        
    }
}
