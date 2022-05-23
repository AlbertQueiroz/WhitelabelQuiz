//
//  AudioManager\.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 21/05/22.
//

import Foundation
import AVFoundation

class SoundManager {
    static var audioPlayer: AVAudioPlayer!

    static func playSound(resource: String) {
        guard let soundURL = Bundle.main.url(
            forResource: resource,
            withExtension: "mp3"
        ), UserDefaults.standard.bool(forKey: "isSoundEnabled")
        else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
}
