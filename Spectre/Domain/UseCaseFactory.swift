//
//  UseCaseFactory.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

class UseCaseFactory {

    // MARK: - Properties

    let entityGateway: EntityGateway


    // MARK: - Initializer

    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Factory methods
    
    func makeScheduleUseCase() -> ShowScheduleUseCase {
        return ShowScheduleUseCase(entityGateway: entityGateway)
    }

    func makeSessionUseCase(_ sessionId: Int64) -> ShowSessionUseCase {
        return ShowSessionUseCase(entityGateway: entityGateway, sessionId: sessionId)
    }
}
