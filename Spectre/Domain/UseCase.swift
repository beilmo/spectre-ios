//
//  UseCase.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 07/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

protocol UseCase {
    associatedtype Success
    func execute(_ completion: (Result<Success, Error>) -> Void)
}
