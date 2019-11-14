//
//  VenueFooterView.swift
//  Spectre
//
//  Created by Nicu Danciu on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class VenueFooterView: UICollectionReusableView, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet weak var separatorHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        separatorHeight.constant = 0.33
    }
}
