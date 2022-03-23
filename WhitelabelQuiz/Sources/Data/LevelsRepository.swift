//
//  LevelsRepository.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import Foundation

final class LevelsRepository {
    private let levelsService: LevelsService

    init(levelsService: LevelsService = LevelsService()) {
        self.levelsService = levelsService
    }

    func read() -> [Level] {
        levelsService.getLevels()
    }
}
