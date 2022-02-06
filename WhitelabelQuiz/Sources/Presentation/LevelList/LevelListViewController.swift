//
//  LevelListViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert on 05/02/22.
//

import UIKit

class LevelListViewController: UIViewController {

    private let getLevelsUseCase = GetLevelUseCase()
    private var levels = [Level]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Níveis"
        getQuestions()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func getQuestions() {
        levels = getLevelsUseCase.execute()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension LevelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        levels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let level = levels[indexPath.row]
        cell.textLabel?.text = "Level \(level.number)"
        return cell
    }

}

extension LevelListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let level = levels[indexPath.row]
        let levelController = QuestionViewController(level: level)

        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(
            levelController,
            animated: false
        )
    }
}
