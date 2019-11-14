//
//  VenueAbstractRow.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class VenueAbstractRow: UICollectionViewCell, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel.font = .preferredFont(forTextStyle: .body)
    }
}

extension VenueAbstractRow {

    func display(text: String) {
        textLabel.text = text
    }
}
