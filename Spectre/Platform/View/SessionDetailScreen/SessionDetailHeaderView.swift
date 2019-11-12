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
    
}

extension SessionDetailHeaderView {

    func display(title: String?) {
        titleLabel.text = title
    }

}
