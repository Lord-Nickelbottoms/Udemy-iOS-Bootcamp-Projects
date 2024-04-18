//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nizaam Haffejee on 2024/03/25.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

//  Model of MVC
struct Question {
    
    let questionText: String
    let answers: [String]
    let correctAnswer: String
    
    init(questionText: String, answers: [String], correctAnswer: String) {
        self.questionText = questionText
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
