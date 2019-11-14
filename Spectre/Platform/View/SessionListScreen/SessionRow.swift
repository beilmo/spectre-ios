//
//  SessionRow.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionRow: UITableViewCell, NibIdentifiable, ReuseIdentifiable {
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var endTimeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var roomLabel: UILabel!
}

extension SessionRow {
    
    func display(startTime: String) {
        startTimeLabel.text = startTime
        startTimeLabel.font = .preferredFont(forTextStyle: .callout, weight: .medium)
    }
    
    func display(duration: String) {
        durationLabel.text = duration
        durationLabel.font = .preferredFont(forTextStyle: .caption1, weight: .regular)
    }
    
    func display(endTime: String) {
        endTimeLabel.text = endTime
        endTimeLabel.font = .preferredFont(forTextStyle: .caption1, weight: .medium)
    }
    
    func display(title: String) {
        titleLabel.text = title
        titleLabel.font = .preferredFont(forTextStyle: .body, weight: .medium)
    }
    
    func display(room: String) {
        roomLabel.text = room
        roomLabel.font = .preferredFont(forTextStyle: .caption1, weight: .regular)
    }
    
}
