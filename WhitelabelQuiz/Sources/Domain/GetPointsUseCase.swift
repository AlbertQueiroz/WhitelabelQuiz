//
//  GetPointsUseCase.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 23/05/22.
//

import Foundation

final class GetPointsUseCase {
    func execute() -> Int {
        UserDefaults.standard.integer(forKey: "points")
    }
}
