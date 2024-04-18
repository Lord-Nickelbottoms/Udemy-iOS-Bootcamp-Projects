//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var billTotal: Float = 0.0
    var tipSplitValue = 0
    var tipPercentage: Float = 0.0
    var percentageText = ""
    
    var result: Float = 0.0
    var calculatorViewModel = TipCalculatorViewModel()
    
    override func viewDidLoad() {
        
        zeroPctButton.addTarget(self, action: #selector(selectionChange(_:)), for: .touchUpInside)
        tenPctButton.addTarget(self, action: #selector(selectionChange(_:)), for: .touchUpInside)
        twentyPctButton.addTarget(self, action: #selector(selectionChange(_:)), for: .touchUpInside)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipSplitValue = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        billTotal = Float(billTextField.text ?? "") ?? 0.0
        
        calculatorViewModel.calculateTip(billTotal: billTotal, tipPercentage: tipPercentage, tipSplitValue: tipSplitValue)
        performSegue(withIdentifier: "toResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultScreen" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = calculatorViewModel.getResult
            destinationVC.numberOfPeople = tipSplitValue
            destinationVC.tipPercentage = percentageText
        }
    }
    
    @objc func selectionChange(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        switch sender.currentTitle {
            case "0%":
                tipPercentage = 0.0
                percentageText = sender.currentTitle ?? ""
                
            case "10%":
                tipPercentage = 0.1
                percentageText = sender.currentTitle ?? ""
                
            case "20%":
                tipPercentage = 0.2
                percentageText = sender.currentTitle ?? ""
                
            default:
                break
        }
    }
}

