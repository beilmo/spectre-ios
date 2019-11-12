//
//  ShowScheduleUseCase.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

class ShowScheduleUseCase: UseCase {
    // MARK: - Properties
    
    private let entityGateway: EntityGateway
    
    
    // MARK: - Initializer
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - UseCase
    
    func execute(_ completion: (Result<[SessionMetaResponse], Error>) -> Void) {
        entityGateway.loadSchedule { (result) in
            completion(result.map({$0.map{SessionMetaResponse(session: $0)}}))
        }
    }
}
