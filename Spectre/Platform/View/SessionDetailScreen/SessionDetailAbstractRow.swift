//
//  SessionDetailAbstractRow.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailAbstractRow: UICollectionViewCell, NibIdentifiable, ReuseIdentifiable {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel.font = .preferredFont(forTextStyle: .body)
    }
}

extension SessionDetailAbstractRow {
    
    func display(text: String) {
        textLabel.text = text
    }
    
}
