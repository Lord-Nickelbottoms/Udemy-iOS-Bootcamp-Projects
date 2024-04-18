//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var magicBallImageView: UIImageView!
    @IBOutlet var askButton: UIButton!

    let ballArray = [UIImage(named: "ball1"), UIImage(named: "ball2"), UIImage(named: "ball3"), UIImage(named: "ball4"), UIImage(named: "ball5")]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshBackground()
    }
    
    func refreshBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.systemGray.cgColor, UIColor.systemBlue.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    @IBAction func askButtonTapped(_ sender: UIButton) {
        magicBallImageView.image = ballArray.randomElement() ?? UIImage()
    }
}
