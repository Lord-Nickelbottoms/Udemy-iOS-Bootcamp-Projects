//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceIamgeView2: UIImageView!
    
    let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]

    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageView1.image = UIImage(named: diceImages.randomElement() ?? "")
        diceIamgeView2.image = UIImage(named: diceImages.randomElement() ?? "")
    }
    
}

