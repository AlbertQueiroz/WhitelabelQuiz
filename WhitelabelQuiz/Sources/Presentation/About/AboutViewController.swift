//
//  AboutViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 16/05/22.
//

import UIKit

class AboutViewController: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sobre-fundo")
        return imageView
    }()
    
    lazy var aboutIndicatorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sobre")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = aboutText
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupBackgroundImageView()
        setupIndicatorImageView()
        setupAboutLabel()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupIndicatorImageView() {
        aboutIndicatorImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutIndicatorImage)
        NSLayoutConstraint.activate([
            aboutIndicatorImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            aboutIndicatorImage.heightAnchor.constraint(equalToConstant: 80),
            aboutIndicatorImage.widthAnchor.constraint(equalToConstant: 200),
            aboutIndicatorImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32)
        ])
    }
    
    private func setupAboutLabel() {
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        NSLayoutConstraint.activate([
//            aboutLabel.topAnchor.constraint(equalTo: aboutIndicatorImage.topAnchor, constant: 80),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 54),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -54),
            aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            aboutLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
}

extension AboutViewController {
    var aboutText: String {
    """
    O Grana é um projeto desenvolvido em 2018 pelo IFCE - Campus Canindé, que visa ensinar Educação Financeira para crianças dos assentamentos rurais de Canindé.
    
    Equipe:
    Programadores (Bolsistas);
    Albert Rayneer Queiroz de Queiroz
    
    Designs (Voluntários);
    Antonia Andreza Ribeiro da Silva
    Rafael Lopes Costa
    
    Roteiristas (Voluntárias):
    Claudiane Gomes Ferreira
    Juliana Silva Maciel
    Fernanda Felipe Leal (Professora)
    
    Coordenador (Professor):
    Carlos Henrique Leitão Cavalcante
    """
    }
}
