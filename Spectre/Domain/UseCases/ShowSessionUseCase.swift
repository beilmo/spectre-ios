//
//  ShowSessionUseCase.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 12/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

class ShowSessionUseCase: UseCase {
    // MARK: - Properties

    private let entityGateway: EntityGateway
    private let sessionId: Int64

    // MARK: - Initializer

    init(entityGateway: EntityGateway, sessionId: Int64) {
        self.entityGateway = entityGateway
        self.sessionId = sessionId
    }

    // MARK: - UseCase

    func execute(_ completion: (Result<SessionDetailResponse, Error>) -> Void) {
        entityGateway.loadSession(sessionId) { (result) in
            completion(result.map{SessionDetailResponse(session: $0)})
        }
    }
}
