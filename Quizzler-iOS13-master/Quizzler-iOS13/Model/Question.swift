//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by HaBV on 22/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String;
    let answer: String;
    
    init(q: String, a: String) {
        question = q
        answer = a
    }
}

struct QuestionMulti {
    let question: String;
    let answer: [String];
    let result: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answer = a
        result = correctAnswer
    }
}
