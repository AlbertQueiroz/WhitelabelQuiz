//
//  SetCurrentLevelUseCase.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 18/05/22.
//

import Foundation

final class SetCurrentLevelUseCase {
    func execute(level: Int) {
        UserDefaults.standard.set(level, forKey: "currentLevel")
    }
}
