//
//  UseCaseFactory+Shared.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

extension UseCaseFactory {
    static let shared: UseCaseFactory = {
        return UseCaseFactory(entityGateway: InMemoryRepo())
    }()
}
