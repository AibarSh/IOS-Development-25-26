//
//  TableCellViewController.swift
//  Favorites
//
//  Created by Macbook Air on 13.11.2025.
//

import UIKit

class TableCellViewController: UITableViewCell{
    @IBOutlet private weak var imageContainer: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var reviewLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(item: CellItem) {
        imageContainer.image = item.image
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
    }
    
}
