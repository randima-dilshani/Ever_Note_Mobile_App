//
//  Note_AppUITests.swift
//  Note AppUITests
//
//  Created by Randima Dilshani on 2023-04-28.
//

import XCTest

final class Note_AppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Notes"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Java Introduction"]/*[[".cells.staticTexts[\"Java Introduction\"]",".staticTexts[\"Java Introduction\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["  Update Note"]/*[[".buttons[\"  Update Note\"].staticTexts[\"  Update Note\"]",".staticTexts[\"  Update Note\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["   Update Note"].tap()
        
        let backButton = app.navigationBars["Note_App.specificView"].buttons["Back"]
        backButton.tap()
        app.navigationBars["Note_App.EditView"].buttons["Back"].tap()
        backButton.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
