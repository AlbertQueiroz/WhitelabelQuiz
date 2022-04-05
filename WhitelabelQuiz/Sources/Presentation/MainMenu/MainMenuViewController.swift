//
//  MainMenuViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 23/03/22.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func play(_ sender: Any) {
        navigationController?.pushViewController(LevelListViewController(), animated: true)
    }
}
