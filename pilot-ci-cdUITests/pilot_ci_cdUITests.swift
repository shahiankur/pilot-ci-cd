//
//  pilot_ci_cdUITests.swift
//  pilot-ci-cdUITests
//
//  Created by Ankur Shahi on 26/09/23.
//

import XCTest

final class pilot_ci_cdUITests: XCTestCase {

    var app: XCUIApplication!
    var monthlyInvestments: XCUIElement!
    var retirementAge: XCUIElement!
    var currentAge: XCUIElement!
    var rateOfInterest: XCUIElement!
    var currentSavings: XCUIElement!
    var calculateRetirmentAmountButton: XCUIElement!
    var resultLabel: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launch()
        
        monthlyInvestments = app.textFields["monthlyInvestments"]
        currentAge = app.textFields["currentAge"]
        retirementAge = app.textFields["retirementAge"]
        rateOfInterest = app.textFields["rateOfInterest"]
        currentSavings = app.textFields["currentSavings"]
        calculateRetirmentAmountButton = app.buttons["calculateRetirementAmountButton"]
        resultLabel = app.staticTexts["resultLabel"]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        monthlyInvestments = nil
        currentAge = nil
        retirementAge = nil
        rateOfInterest = nil
        currentSavings = nil
        calculateRetirmentAmountButton = nil
        resultLabel = nil
        try super.tearDownWithError()
    }

    func testRetirementViewController_whenValuesProvided_resultLabelDisplaysCorrectValues() throws {
        // UI tests must launch the application that they test.
        monthlyInvestments.tap()
        monthlyInvestments.typeText("100")
        
        currentAge.tap()
        currentAge.typeText("32")
        
        retirementAge.tap()
        retirementAge.typeText("65")
        
        rateOfInterest.tap()
        rateOfInterest.typeText("12")
        
        currentSavings.tap()
        currentSavings.typeText("200")
        
        calculateRetirmentAmountButton.tap()
        
        XCTAssertEqual(resultLabel.label, "If you save $100.0 every month for 33 years, and invest that money plus your current investment of $200.0 at a 12.0% anual interest rate, you will have $6.185398792968953e+21 by the time you are 65")
    }

//    func testRetirementViewController_whenValuesProvided_resultLabelDisplaysCorrectValues_Failed() throws {
//        // UI tests must launch the application that they test.
//        monthlyInvestments.tap()
//        monthlyInvestments.typeText("100")
//        
//        currentAge.tap()
//        currentAge.typeText("32")
//        
//        retirementAge.tap()
//        retirementAge.typeText("65")
//        
//        rateOfInterest.tap()
//        rateOfInterest.typeText("12")
//        
//        currentSavings.tap()
//        currentSavings.typeText("200")
//        
//        calculateRetirmentAmountButton.tap()
//        
//        XCTAssertEqual(resultLabel.label, "If you save $100.0 every month for 33 years, and invest that money plus your current investment of $200.0 at a 12.0% anual interest rate, you will have $6.185398792968953e+21 by the time you are 65.")
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
