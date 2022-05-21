//
//  StoreItemCollectionViewCell.swift
//  WhitelabelQuiz
//
//  Created by Albert Rayneer on 21/05/22.
//

import UIKit

class StoreItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with item: StoreItem) {
        nameLabel.text = item.name
        image.image = UIImage(named: item.imageName)
        priceLabel.text = "\(item.price)"
    }

}
