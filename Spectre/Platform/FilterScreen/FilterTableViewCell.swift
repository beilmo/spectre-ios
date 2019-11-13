//
//  FilterTableViewCell.swift
//  Spectre
//
//  Created by Alex Zaharia on 13/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkBox: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        icon = nil
        label = nil
        checkBox = nil
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        icon = nil
        label = nil
        checkBox = nil
    }
}
