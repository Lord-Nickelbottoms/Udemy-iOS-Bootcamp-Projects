//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var firstAnswerButton: UIButton!
    @IBOutlet var secondAnswerButton: UIButton!
    @IBOutlet var thirdAnswerButton: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer ?? "")
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        for answer in quizBrain.getAnswerText() {
            firstAnswerButton.setTitle(, for: .normal)
        }
        
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
    }
}

