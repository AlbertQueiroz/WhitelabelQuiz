//
//  MusicManager.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 21/05/22.
//

import Foundation
import AVFoundation

class MusicManager {
    static var audioPlayer: AVAudioPlayer!
    
    static func playBackgroundMusic() {
        guard audioPlayer == nil else { return playIfNeeded() }
        if let musicURL = Bundle.main.url(forResource: "audio-fundo", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: musicURL)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.volume = 0.2
            } catch {
                print("Unable to play music: \(error.localizedDescription)")
            }
        } else {
            print("Unable to find music file")
        }
        
        playIfNeeded()
    }
    
    private static func playIfNeeded() {
        if UserDefaults.standard.bool(forKey: "isMusicEnabled") {
            playMusic()
        } else {
            stopMusic()
        }
    }
    
    static func playMusic() {
        audioPlayer.play()
    }
    
    static func stopMusic() {
        audioPlayer.stop()
    }
}
