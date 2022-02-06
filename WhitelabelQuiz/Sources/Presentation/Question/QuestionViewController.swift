//
//  QuestionViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import UIKit

final class QuestionViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!

    private let level: Level

    private var question: Question {
        level.questions[0]
    }

    init(level: Level) {
        self.level = level
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
        setupAnswers()
        navigationController?.navigationBar.isHidden = true
    }

    private func setupQuestion() {
        questionLabel.text = question.question
    }

    private func setupAnswers() {
        answerOneButton.setTitle(question.answers[0], for: .normal)
        answerTwoButton.setTitle(question.answers[1], for: .normal)
        answerThreeButton.setTitle(question.answers[2], for: .normal)
        answerFourButton.setTitle(question.answers[3], for: .normal)
    }

    @IBAction func close(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}
