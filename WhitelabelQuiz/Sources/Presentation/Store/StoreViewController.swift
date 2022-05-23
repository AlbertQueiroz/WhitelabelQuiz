//
//  StoreViewController.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 21/05/22.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    
    private var points: Int {
        GetPointsUseCase().execute()
    }
    private var currentItem = 0
    
    private var items: [StoreItem] = [
        .init(name: "Celular", imageName: "celular", price: 400),
        .init(name: "Televisão", imageName: "televisao", price: 600),
        .init(name: "Viagem", imageName: "viagem", price: 800),
        .init(name: "Video Game", imageName: "video-game", price: 900)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setItem()
        setPoints()
    }
    
    @IBAction func buy(_ sender: Any) {
        let item = items[currentItem]
        guard points >= item.price else { return blockItemAlert() }
        SetPointsUseCase().execute(points: points - item.price)
        SoundManager.playSound(resource: "click")
        setPoints()
    }
    
    private func blockItemAlert() {
        let alert = UIAlertController(title: "Saldo insuficiente", message: "Infelizmente, você não possuí crédito suficiente para este item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func nextItem(_ sender: Any) {
        currentItem += currentItem == items.count - 1 ? 0 : 1
        setItem()
    }
    
    @IBAction func previousItem(_ sender: Any) {
        currentItem -= currentItem == 0 ? 0 : 1
        setItem()
    }
    
    private func setPoints() {
        pointsLabel.text = "\(points)"
    }
    
    private func setItem() {
        let item = items[currentItem]
        itemName.text = item.name
        itemImage.image = UIImage(named: item.imageName)
        itemPrice.text = "\(item.price)"
    }
    
}
