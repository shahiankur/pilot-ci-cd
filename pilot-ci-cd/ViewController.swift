//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Eduardo Rosas on 8/19/19.
//  Copyright © 2019 Eduardo Rosas. All rights reserved.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("for testing of gitlab pipelines execution on iPhone device")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occured.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        Analytics.trackEvent("navigated_to_calculator")
    }
    
    private func calculateRetirementAmount(currentAge: Int, retirementAge : Int, monthlyInvestment: Float, currentSavings: Float, interestRate: Float) -> Double {
        let monthsUntilRetirement = (retirementAge - currentAge) * 12
        
        var retiremenAmount = Double(currentSavings) * pow(Double(1+interestRate/100), Double(monthsUntilRetirement))
        
        for idx in 1...monthsUntilRetirement {
            let monthlyRate = interestRate / 100 / 12
            retiremenAmount += Double(monthlyInvestment) * pow(Double(1+monthlyRate), Double(idx))
        }
        
        return retiremenAmount
    }

    @IBAction func calculateButton_TouchUpInside(_ sender: Any) {
        // MSCrashes.generateTestCrash()
        let currentAge: Int? = Int(ageTextField.text!)
        let plannedRetirementAge: Int? = Int(retirementAgeTextField.text!)
        let monthlyInvestment: Float? = Float(monthlyInvestmentsTextField.text!)
        let currentSavings: Float? = Float(savingsTextField.text!)
        let interestRate: Float? = Float(interestRateTextField.text!)
        
        let retirementAmount = calculateRetirementAmount(currentAge: currentAge!, retirementAge: plannedRetirementAge!, monthlyInvestment: monthlyInvestment!, currentSavings: currentSavings!, interestRate: interestRate!)
        
        resultLabel.text = "If you save $\(monthlyInvestment!) every month for \(plannedRetirementAge! - currentAge!) years, and invest that money plus your current investment of $\(currentSavings!) at a \(interestRate!)% anual interest rate, you will have $\(retirementAmount) by the time you are \(plannedRetirementAge!)"
        
        let properties = ["current_age": String(currentAge!),
                          "planned_retirement_age": String(plannedRetirementAge!)]
        
        Analytics.trackEvent("calculate_retirement_amount", withProperties: properties)
    }
    
    func test() {
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
        print("a")
    }
    
}
