//
//  SessionDetailHeaderView.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailHeaderView: UICollectionReusableView, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.font = .preferredFont(forTextStyle: .title3, weight: .semibold)
        separatorHeight.constant = 0.33
    }
}

extension SessionDetailHeaderView {

    func display(title: String?) {
        titleLabel.text = title
    }
}
