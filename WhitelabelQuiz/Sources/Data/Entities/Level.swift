//
//  Level.swift
//  WhitelabelQuiz
//
//  Created by Albert on 05/02/22.
//

import Foundation

struct Level: Codable {
    let number: Int
    let questions: [Question]
}
