//
//  GetCurrentLevelUseCase.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 18/05/22.
//

import Foundation

final class GetCurrentLevelUseCase {
    func execute() -> Int {
        UserDefaults.standard.integer(forKey: "currentLevel")
    }    
}
