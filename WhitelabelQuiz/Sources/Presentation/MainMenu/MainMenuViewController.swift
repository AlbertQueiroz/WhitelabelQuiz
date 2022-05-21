//
//  MainMenuViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 23/03/22.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    
    private var isMusicEnabled: Bool {
        let isMusicEnabledKey = "isMusicEnabled"
        return UserDefaults.standard.bool(forKey: isMusicEnabledKey)
    }
    
    private var isSoundEnabled: Bool {
        let isSoundEnabledKey = "isSoundEnabled"
        return UserDefaults.standard.bool(forKey: isSoundEnabledKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAudioButtons()
    }

    @IBAction func play(_ sender: Any) {
        route(to: LevelListViewController())
    }
    
    @IBAction func store(_ sender: Any) {
        route(to: StoreViewController())
    }
    
    @IBAction func about(_ sender: Any) {
        route(to: AboutViewController())
    }
    
    private func route(to controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
        SoundManager.playSound(resource: "click")
    }
    
    @IBAction func soundAction(_ sender: Any) {
        UserDefaults.standard.set(!isSoundEnabled, forKey: "isSoundEnabled")
        setSoundButtonImage()
    }
    
    @IBAction func musicAction(_ sender: Any) {
        UserDefaults.standard.set(!isMusicEnabled, forKey: "isMusicEnabled")
        MusicManager.playBackgroundMusic()
        setMusicButtonImage()
    }
    
    private func setAudioButtons() {
        setSoundButtonImage()
        setMusicButtonImage()
    }
    
    private func setSoundButtonImage() {
        soundButton.tintColor = isSoundEnabled ? .orange : .gray
    }
    
    private func setMusicButtonImage() {
        musicButton.tintColor = isMusicEnabled ? .orange : .gray
    }
    
    
}
