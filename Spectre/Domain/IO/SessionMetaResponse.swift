//
//  SessionResponse.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

struct SessionMetaResponse: Identifiable {
    let id: Int64
    let startTime: Date
    let duration: TimeInterval
    let endTime: Date
    let title: String
    let room: String

    init(session: Session) {
        self.id = session.id
        self.startTime = Date(timeIntervalSince1970: TimeInterval(session.date))
        self.duration = TimeInterval(session.duration)
        self.endTime = self.startTime.addingTimeInterval(self.duration)
        self.title = session.title
        self.room = session.room
    }
}
