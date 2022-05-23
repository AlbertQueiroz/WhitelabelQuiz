//
//  LevelListViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 05/02/22.
//

import UIKit

class LevelListViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    private let getLevelsUseCase = GetLevelUseCase()
    private var levels = [Level]()
    private var currentLevel: Int {
        GetCurrentLevelUseCase().execute()
    }
    
    private var points: Int {
        GetPointsUseCase().execute()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestions()
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        setButtonsImages()
        setPoints()
    }

    private func getQuestions() {
        levels = getLevelsUseCase.execute()
    }
    
    @IBAction func openLevel(_ sender: Any) {
        guard let sender = sender as? UIButton,
              sender.tag - 1 <= currentLevel else { return blockLevelAlert() }
        let level = levels[sender.tag - 1]
        let levelController = QuestionViewController(level: level)
        
        navigationController?.pushViewController(
            levelController,
            animated: false
        )
    }
    
    private func blockLevelAlert() {
        let alert = UIAlertController(title: "Nível bloqueado", message: "Infelizmente, este nível está bloqueado", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func setPoints() {
        pointsLabel.text = "\(points)"
    }
    
    private func setButtonsImages() {
        for tmpTag in 1...5 {
            guard let tmpButton = view.viewWithTag(tmpTag) as? UIButton else { continue }
            setButtonImage(tmpButton)
        }
    }
    
    private func setButtonImage(_ button: UIButton) {
        var imageName = "nivel-novo"
        if button.tag - 1 > currentLevel {
            imageName = "nivel-bloq"
        } else if button.tag - 1 == currentLevel {
            imageName = "nivel"
        }
        
        let image = UIImage(named: imageName)
        button.setBackgroundImage(image, for: .normal)
    }
}
