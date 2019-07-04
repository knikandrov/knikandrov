//
//  Question.swift
//  QuizAppDiplom
//
//  Created by Konstantin Nikandrov on 15/02/2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let Answer1: String
    let Answer2: String
    let Answer3: String
    let Answer4: String
    let CorrectAnswer: Int
    
    init(QuestionText: String, choice1: String, choice2: String, choice3: String, choice4: String, answer: Int){
        question = QuestionText
        Answer1 = choice1
        Answer2 = choice2
        Answer3 = choice3
        Answer4 = choice4
        CorrectAnswer = answer
    }
}
