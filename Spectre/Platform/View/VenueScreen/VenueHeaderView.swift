//
//  VenueHeaderView.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class VenueHeaderView: UICollectionReusableView, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2, weight: .semibold)
    }
}

extension VenueHeaderView {
    
    func display(title: String?) {
        titleLabel.text = title
    }
}
