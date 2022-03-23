//
//  Question.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import Foundation

struct Question: Codable {
    let question: String
    let answerIndex: Int
    let answers: [String]
}
