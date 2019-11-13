//
//  SessionDetailActionRow.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailActionRow: UICollectionViewCell, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.isHidden = imageView.image == nil
        separatorHeight.constant = 0.33
        
        titleLabel.font = .preferredFont(forTextStyle: .body)
    }
}

extension SessionDetailActionRow {

    func display(image: UIImage?) {
        imageView.image = image
        imageView.isHidden = imageView.image == nil
    }

    func display(title: String) {
        titleLabel.text = title
    }

}
