//
//  ViewController.swift
//  pilot-ci-cd
//
//  Created by Ankur Shahi on 26/09/23.
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "An error might have occured", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
        Analytics.trackEvent("navigated_to_calculate_retirement_screen")
    }


    @IBAction func calculateButton_TouchUpInside(_ sender: Any) {
//        Crashes.generateTestCrash()
        let currentAge = ageTextField.text ?? ""
        let retirementAge = retirementAgeTextField.text ?? ""
        
        let properties = ["currentAge": currentAge, "retirementAge": retirementAge]
        
        Analytics.trackEvent("calculate_retirement_button_tapped", withProperties: properties)
    }
    
}

