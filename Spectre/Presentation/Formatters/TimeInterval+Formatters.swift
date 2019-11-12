//
//  TimeInterval+Formatters.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 11/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation


public extension TimeInterval {
    func minutes() -> String {
        return Formatter.shared.minutes.string(from: self) ?? ""
    }
}

private extension TimeInterval {
    class Formatter {

        // MARK: - Shared

        static let shared = Formatter()

        // MARK: - Formatters

        let minutes: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.minute]
            formatter.zeroFormattingBehavior = .pad
            return formatter
        }()
    }
}
