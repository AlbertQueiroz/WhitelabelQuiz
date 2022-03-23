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

    private func hideNavBar() {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func rightAnswer() {
        nextQuestion()
    }

    private func wrongAnswer() {
        print("Wrong Answer")
    }

    private func nextQuestion() {
        currentQuestion += 1
        tableView.reloadData()
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
        switch section {
        case 0:
            return 1
        case 1:
            return answers.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        switch indexPath.section {
        case 0:
            cell.textLabel?.text = question.question
            cell.textLabel?.textAlignment = .center
        case 1:
            cell.textLabel?.text = answers[indexPath.row]
        default:
            return cell
        }
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 60
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }

        let cell = tableView.cellForRow(at: indexPath)

        let correctAnswer = indexPath.row == question.answerIndex

        if correctAnswer {
            rightAnswer()
            cell?.backgroundColor = .green
        } else {
            wrongAnswer()
            cell?.backgroundColor = .red
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
