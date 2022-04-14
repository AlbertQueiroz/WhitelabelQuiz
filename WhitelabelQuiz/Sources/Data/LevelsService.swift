//
//  LevelsService.swift
//  WhitelabelQuiz
//
//  Created by Albert on 22/03/22.
//

import Foundation
import FirebaseRemoteConfig

final class LevelsService {
    
    private let remoteConfig = RemoteConfig.remoteConfig()

    func getLevels() -> [Level] {
        let remoteJsonData = remoteConfig.configValue(forKey: "quiz_questions").dataValue
        
        guard let levels = try? JSONDecoder().decode(
            [Level].self,
            from: remoteJsonData
        ) else { return getLocalLevels() }
        
        return levels
    }
    
    func getLocalLevels() -> [Level] {
        guard let path = Bundle.main.url(forResource: "levels", withExtension: "json"),
              let data = try? Data(contentsOf: path),
              let levels = try? JSONDecoder().decode([Level].self, from: data) else { return [] }
        return levels
    }
    
}
