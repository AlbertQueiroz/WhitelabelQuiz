//
//  GetLevelsUseCase.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import Foundation

final class GetLevelUseCase {

    private let levelsRepository: LevelsRepository

    init(levelsRepository: LevelsRepository = LevelsRepository()) {
        self.levelsRepository = levelsRepository
    }

    func execute() -> [Level] {
        levelsRepository.read()
    }
}
