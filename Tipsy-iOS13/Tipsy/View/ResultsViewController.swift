//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nizaam Haffejee on 2024/04/03.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var total: Float?
    var numberOfPeople: Int?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", total ?? 0.0)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0), with \(tipPercentage ?? "") tip."
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
