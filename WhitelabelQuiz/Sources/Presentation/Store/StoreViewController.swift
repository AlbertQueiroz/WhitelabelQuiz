//
//  StoreViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 21/05/22.
//

import UIKit

class StoreViewController: UIViewController {

    private var items: [StoreItem] = [
        .init(name: "Celular", imageName: "celular", price: 400),
        .init(name: "Celular", imageName: "celular", price: 400),
        .init(name: "Celular", imageName: "celular", price: 400),
        .init(name: "Celular", imageName: "celular", price: 400)
    ]
    @IBOutlet weak var itemsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsCollection.delegate = self
        itemsCollection.dataSource = self
        let cellNib = UINib(nibName: "StoreItemCollectionViewCell", bundle: nil)
        itemsCollection.register(cellNib, forCellWithReuseIdentifier: "StoreItemCell")
        setupNavigationBar()
    }
    
    @IBAction func buy(_ sender: Any) {
        SoundManager.playSound(resource: "click")
    }
    
}

extension StoreViewController: UICollectionViewDelegate {
    
}

extension StoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = itemsCollection.dequeueReusableCell(
            withReuseIdentifier: "StoreItemCell",
            for: indexPath
        ) as? StoreItemCollectionViewCell else { return UICollectionViewCell() }
        let item = items[indexPath.row]
        cell.setup(with: item)
        
        return cell
    }
}
