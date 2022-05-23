//
//  UIViewController+Additions.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 18/04/22.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .clear
        
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        containerView.addTarget(self, action: #selector(close), for: .touchUpInside)
        let imageSearch = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        imageSearch.image = UIImage(named: "voltar")?.withRenderingMode(.alwaysOriginal)
        containerView.addSubview(imageSearch)
        let backButtonItem = UIBarButtonItem(customView: containerView)
        backButtonItem.width = 30
        navigationItem.leftBarButtonItem = backButtonItem
        
    }
    
    @objc fileprivate func close() {
        navigationController?.popViewController(animated: true)
    }
}
