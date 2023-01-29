//
//  CalculatorAppUITests.swift
//  CalculatorAppUITests
//
//  Created by Alexey Budynkov on 23.01.2023.
//

import XCTest

final class CalculatorAppUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func pushTheButton(label:String){
        if app.buttons[label].waitForExistence(timeout: 5) {
            app.buttons[label].tap()
        }
        else{
            XCTFail("No such button \(label)")
        }
    }

    func testExample() throws {
        //        ● Type2
        //        ● Type+
        //        ● Type3
        //        ● Result = 5
        //        ● Type*
        //        ● Type4
        //        ● Result = 20
        
        app.launch()

        pushTheButton(label: "2")
        pushTheButton(label: "+")
        pushTheButton(label: "3")
        pushTheButton(label: "=")
        pushTheButton(label: "×")
        pushTheButton(label: "4")
        pushTheButton(label: "=")
        
        sleep(1)
        let resultText = app.staticTexts["20"]
        
            
        XCTAssertEqual(resultText.label, "20")
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
