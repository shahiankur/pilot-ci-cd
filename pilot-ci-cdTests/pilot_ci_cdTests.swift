//
//  pilot_ci_cdTests.swift
//  pilot-ci-cdTests
//
//  Created by Ankur Shahi on 26/09/23.
//

import XCTest
@testable import pilot_ci_cd

final class PilotCiCdTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: ViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testViewController_whenCreated_hasRequiredFieldsEmpty() throws {
        let mothlyInvestments = try XCTUnwrap(sut.monthlyInvestmentsTextField)
        let currentAge = try XCTUnwrap(sut.ageTextField)
        let retirementAge = try XCTUnwrap(sut.retirementAgeTextField)
        let rateOfInterest = try XCTUnwrap(sut.interestRateTextField)
        let currentSavings = try XCTUnwrap(sut.savingsTextField)
        
        XCTAssertEqual(mothlyInvestments.text, "")
        XCTAssertEqual(currentAge.text, "")
        XCTAssertEqual(retirementAge.text, "")
        XCTAssertEqual(rateOfInterest.text, "")
        XCTAssertEqual(currentSavings.text, "")
    }
    
    func testViewController_whenCreated_hasRequiredFieldsEmpty_Failed() throws {
        let mothlyInvestments = try XCTUnwrap(sut.monthlyInvestmentsTextField)
        let currentAge = try XCTUnwrap(sut.ageTextField)
        let retirementAge = try XCTUnwrap(sut.retirementAgeTextField)
        let rateOfInterest = try XCTUnwrap(sut.interestRateTextField)
        let currentSavings = try XCTUnwrap(sut.savingsTextField)
        
        XCTAssertEqual(mothlyInvestments.text, "mothlyInvestments")
        XCTAssertEqual(currentAge.text, "currentAge")
        XCTAssertEqual(retirementAge.text, "retirementAge")
        XCTAssertEqual(rateOfInterest.text, "rateOfInterest")
        XCTAssertEqual(currentSavings.text, "currentSavings")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
