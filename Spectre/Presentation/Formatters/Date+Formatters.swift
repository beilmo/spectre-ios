//
//  Date+Formatters.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

public extension Date {
    func shortTime() -> String {
        return Formatter.shared.shortTime.string(from: self)
    }
}

private extension Date {
    class Formatter {

        // MARK: - Shared

        static let shared = Formatter()

        // MARK: - Formatters

        let shortTime: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()
    }
}
