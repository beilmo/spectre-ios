//
//  InMemoryRepo.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation
import SwiftProtobuf

class InMemoryRepo: EntityGateway {
    func loadSession(_ id: Int64, _ completion: (Result<Session, Error>) -> Void) {
        completion(.success(Session.with { s in
            s.id = Int64.random(in: 0...10)
            s.date = 1573486358
            s.duration = 1800
            s.title = "Advanced Debugging with Xcode and LLDB"
            s.room = "Classroom"
            s.abstract = """
            Discover advanced techniques, and tips and tricks for enhancing your Xcode debugging workflows. Learn how to take advantage of LLDB and custom breakpoints for more powerful debugging. Get the most out of Xcode's view debugging tools to solve UI issues in your app more efficiently.
            Discover advanced techniques, and tips and tricks for enhancing your Xcode debugging workflows. Learn how to take advantage of LLDB and custom breakpoints for more powerful debugging. Get the most out of Xcode's view debugging tools to solve UI issues in your app more efficiently.
            """
            s.keywords = ["Debugging", "LLDB", "Xcode", "Bugs"]
            s.speakers = [
                Speaker.with({ speaker in
                    speaker.firstName = "Josh"
                    speaker.lastName = "Barna"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Ramsey"
                    speaker.lastName = "Welt"
                }),
                Speaker.with({ speaker in
                    speaker.firstName = "Johnny"
                    speaker.lastName = "Cel Viteaz"
                })
            ]
        }))
    }
    
    let sessions = Array(repeating: Session.with { s in
        s.id = Int64.random(in: 0...10)
        s.date = 1573486358
        s.duration = 1800
        s.title = "Advanced Debugging with Xcode and LLDB"
        s.room = "Classroom"
    }, count: 10)

    func loadSchedule(_ completion: (Result<[Session], Error>) -> Void) {
        completion(.success(sessions))
    }
}
