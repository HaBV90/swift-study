//
//  QuizBrainMulti.swift
//  Quizzler-iOS13
//
//  Created by HaBV on 23/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrainMulti {
    let quiz = [
        QuestionMulti(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        QuestionMulti(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        QuestionMulti(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        QuestionMulti(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        QuestionMulti(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        QuestionMulti(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        QuestionMulti(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        QuestionMulti(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        QuestionMulti(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        QuestionMulti(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    var questionNumber = 0
    var scoreNumber = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if(userAnswer == quiz[questionNumber].result) {
            scoreNumber += 1
            return true
        } else {
            return false
        }
    }
    
    func getAnswerText() -> [String] {
        return quiz[questionNumber].answer
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    mutating func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if(questionNumber + 1 < quiz.count) {
            questionNumber += 1
        } else {
            questionNumber = 0
            scoreNumber = 0
        }
    }
    
    mutating func getScore() -> Int {
        return scoreNumber
    }
    
}
