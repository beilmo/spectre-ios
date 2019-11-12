//
//  SessionDetailResponse.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 12/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

struct SessionDetailResponse: Identifiable {
    let id: Int64
    let topic: SessionTopicResponse
    let abstract: SessionAbstractResponse
    let speakers: [SessionSpeakerResponse]
    let resources: [SessionResourceResponse]
    let tags: [SessionTagResponse]

    init(session: Session) {
        self.id = session.id
        self.topic = SessionTopicResponse(title: session.title,
                                          subtitle: "MobOS 2020",
                                          room: session.room,
                                          startDate: Date(timeIntervalSince1970: TimeInterval(session.date)),
                                          duration: TimeInterval(session.duration))
        self.abstract = SessionAbstractResponse(text: session.abstract)
        self.speakers = session.speakers.map({SessionSpeakerResponse(id: $0.id,
                                                                     firstName: $0.firstName,
                                                                     lastName: $0.lastName)})
        self.resources = []
        self.tags = session.keywords.map({SessionTagResponse(name: $0)})
    }
}
