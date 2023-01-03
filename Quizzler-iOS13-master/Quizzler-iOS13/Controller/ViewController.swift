//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    
    //    var quizBrain = QuizBrain()
    var quizBrainMulti = QuizBrainMulti()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
//        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        let userGotItRight = quizBrainMulti.checkAnswer(userAnswer)
        
        if ( userGotItRight ) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
//        quizBrain.nextQuestion()
        quizBrainMulti.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
    }
    
    @objc func updateUI() {
        //Simple answer
//        scoreLabel.text = "Score: \(quizBrain.getScore())"
//        questionLabel.text = quizBrain.getQuestionText()
//        trueButton.backgroundColor = UIColor.clear
//        falseButton.backgroundColor = UIColor.clear
//        progressBar.progress = quizBrain.getProgress()
        
        // multi answer
        scoreLabel.text = "Score: \(quizBrainMulti.getScore())"
        questionLabel.text = quizBrainMulti.getQuestionText()
        
        let answerChoices = quizBrainMulti.getAnswerText()
        choiceOne.setTitle(answerChoices[0], for: .normal)
        choiceTwo.setTitle(answerChoices[1], for: .normal)
        choiceThree.setTitle(answerChoices[2], for: .normal)
        
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        progressBar.progress = quizBrainMulti.getProgress()
    }
    
}

