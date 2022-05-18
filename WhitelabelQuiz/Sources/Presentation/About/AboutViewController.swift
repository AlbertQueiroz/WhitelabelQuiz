//
//  AboutViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 16/05/22.
//

import UIKit

class AboutViewController: UIViewController {

    lazy var textView: UITextView = {
       let view = UITextView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
}
