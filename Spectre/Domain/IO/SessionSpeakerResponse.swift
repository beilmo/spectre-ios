//
//  SessionSpeakersResponse.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

struct SessionSpeakerResponse: Identifiable, Hashable {
    let id: Int64
    let firstName: String
    let lastName: String
}
