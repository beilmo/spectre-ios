//
//  EntityGateway.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

protocol EntityGateway {
    func loadSchedule(_ completion: (Result<[Session], Swift.Error>) -> Void)
    func loadSession(_ id: Int64, _ completion: (Result<Session, Swift.Error>) -> Void)
}
