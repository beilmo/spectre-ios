//
//  SessionDetailTopicRow.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class SessionDetailTopicRow: UICollectionViewCell, NibIdentifiable, ReuseIdentifiable {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var roomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .preferredFont(forTextStyle: .title1, weight: .bold)
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline, weight: .semibold)
        startTimeLabel.font = .preferredFont(forTextStyle: .subheadline, weight: .semibold)
        durationLabel.font = .preferredFont(forTextStyle: .subheadline, weight: .semibold)
        roomLabel.font = .preferredFont(forTextStyle: .subheadline, weight: .semibold)
    }
}

extension SessionDetailTopicRow {

    func display(title: String) {
        titleLabel.text = title
    }

    func display(subtitle: String) {
        subtitleLabel.text = subtitle
    }

    func display(startTime: String) {
        startTimeLabel.text = startTime
    }

    func display(duration: String) {
        durationLabel.text = duration
    }

    func display(room: String) {
        roomLabel.text = room
    }

}
