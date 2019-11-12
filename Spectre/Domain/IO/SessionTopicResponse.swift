//
//  SessionTopicResponse.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

struct SessionTopicResponse: Hashable {
    let title: String
    let subtitle: String
    let room: String
    let startDate: Date
    let duration: TimeInterval
}
