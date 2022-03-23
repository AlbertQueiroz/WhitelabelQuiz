//
//  LevelsService.swift
//  WhitelabelQuiz
//
//  Created by Albert on 22/03/22.
//

import Foundation

final class LevelsService {

    func getLevels() -> [Level] {
        guard let path = Bundle.main.url(forResource: "levels", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let levels = try? JSONDecoder().decode([Level].self, from: data) else { return [] }
        return levels
    }
    
}
