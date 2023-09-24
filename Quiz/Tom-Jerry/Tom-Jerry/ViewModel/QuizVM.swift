//
//  QuizVM.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-25.
//

import Foundation




struct QuizVM {
    
    let quiz: [QuizModel] = Bundle.main.decode("quiz.json")
    var questionNumber = 0
    var score = 0
    
    
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answer
    }
    

    mutating func getScore() -> String {
        return String(score)
    }
    
     mutating func nextQuestion() -> Bool{
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            return true
        } else {
       
            return false
       
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
   
}


