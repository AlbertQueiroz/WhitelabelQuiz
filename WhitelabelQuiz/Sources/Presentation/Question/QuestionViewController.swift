//
//  QuestionViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 06/02/22.
//

import UIKit

final class QuestionViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    private let level: Level

    private var currentQuestion = 0

    private var question: Question {
        level.questions[currentQuestion]
    }

    private var answers: [String] {
        question.answers
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
        hideNavBar()
        setupTableView()

    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

    private func didAnswer() {
        let thereIsNextQuestion = currentQuestion + 1 < level.questions.count
        if thereIsNextQuestion {
            nextQuestion()
        } else {
            levelComplete()
        }
    }

    private func nextQuestion() {
        currentQuestion += 1
        tableView.reloadData()
    }

    private func levelComplete() {
        let alert = UIAlertController(title: "Level Complete", message: "Congratulations, you have completed this level", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            self.navigationController?.popViewController(animated: false)
        })
        
        SetCurrentLevelUseCase().execute(level: level.number)
        
        present(alert, animated: true, completion: nil)
    }

    private func hideNavBar() {
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func close(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension QuestionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = .clear
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = question.question
            cell.isUserInteractionEnabled = false
            setAnswerBackground(for: cell, at: .question)
        case 1:
            cell.textLabel?.text = answers[indexPath.row]
            cell.selectionStyle = .none
            setAnswerBackground(for: cell, at: .clear)
        default:
            return cell
        }
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 300 : 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }

        let cell = tableView.cellForRow(at: indexPath)

        let correctAnswer = indexPath.row == question.answerIndex
        let correctAnswerCell = tableView.cellForRow(at: IndexPath(row: question.answerIndex, section: 1))
        setAnswerBackground(for: correctAnswerCell, at: .correct)

        if !correctAnswer {
            setAnswerBackground(for: cell, at: .wrong)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.didAnswer()
        }
    }
}

extension QuestionViewController {
    private enum AnswerStatus {
        case question
        case clear
        case correct
        case wrong
    }
    
    private func setAnswerBackground(
        for cell: UITableViewCell?,
        at status: AnswerStatus
    ) {
        var imageName: String
        switch status {
        case .clear:
            imageName = "item-branco"
        case .correct:
            imageName = "item-verde"
        case .wrong:
            imageName = "item-vermelho"
        case .question:
            imageName = "perg"
        }
        
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        cell?.backgroundView = imageView
    }
}
