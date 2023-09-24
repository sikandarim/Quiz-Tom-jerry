//
//  QuizModel.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-25.
//

import Foundation
struct QuizModel: Codable, Identifiable {
    let id : String
    let question: String
    let answer: [String]
    let correctAnswer: String
  
}

