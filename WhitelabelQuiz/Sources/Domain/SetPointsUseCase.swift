//
//  SetPointsUseCase.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 23/05/22.
//

import Foundation

final class SetPointsUseCase {
    func execute(points: Int) {
        UserDefaults.standard.set(points, forKey: "points")
    }
}
