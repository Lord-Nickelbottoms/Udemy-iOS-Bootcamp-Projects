//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Nizaam Haffejee on 2024/03/26.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quizQuestions = [
        Question(questionText: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(questionText: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], correctAnswer: "100"),
        Question(questionText: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(questionText: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(questionText: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(questionText: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(questionText: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(questionText: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(questionText: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(questionText: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var userScore = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        var result = false
        
        for answer in quizQuestions[questionNumber].answers {
            if userAnswer == answer {
                userScore += 1
                result  = true
            } else {
                result = false
            }
        }
        
        return result
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quizQuestions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            userScore = 0
        }
    }
    
    func getQuestionText() -> String {
        return quizQuestions[questionNumber].questionText
    }
    
    func getAnswerText() -> [String] {
        return quizQuestions[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quizQuestions.count)
    }
    
    func getScore() -> Int {
        return userScore
    }
}
