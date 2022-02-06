//
//  LevelsRepository.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import Foundation

final class LevelsRepository {
    let questions = [Question(question: "Aqui ficam as perguntas", answers: ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"])]

    private lazy var levels: [Level] = [
        Level(number: 1, questions: questions),
        Level(number: 2, questions: questions),
        Level(number: 3, questions: questions),
        Level(number: 4, questions: questions)
    ]

    func read() -> [Level] {
        levels
    }
}
