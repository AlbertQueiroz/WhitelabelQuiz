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
    }
    
}
