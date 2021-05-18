//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var percent:Double = 0
    var result: Double = 0
    var resultText = "0.0"
    var people = 2
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        if sender == zeroPctButton {
        zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        if sender == tenPctButton {
            percent = 0.1
        zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
        twentyPctButton.isSelected = false
        }
        if sender == twentyPctButton {
            percent = 0.2
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        people = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("\(billTextField.text!)")
        let input = Double(billTextField.text!)
        result = (input! + (input! * percent)) / Double(splitNumberLabel.text!)!
        resultText = String(format: "%.2f", result)
       print(String(format: "%.2f", result))
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = resultText
            destinationVC.split = people
            destinationVC.tip = Int(percent*100)
            
        }
    }


}

