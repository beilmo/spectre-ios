//
//  UserDefaultsConfig.swift
//  Spectre
//
//  Created by Dorin-Bogdan Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let store: UserDefaults
    let key: String
    let defaultValue: T

    init(_ store: UserDefaults, key: String, defaultValue: T) {
        self.store = store
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return store.object(forKey: key) as? T ?? defaultValue
        }
        set {
            store.set(newValue, forKey: key)
        }
    }
}

struct StandardUserDefaultsConfig {
    @UserDefault(.standard, key: .hasSeenOnboardingKey, defaultValue: false)
    static var hasSeenOnboarding: Bool
}

private extension String {
    static let hasSeenOnboardingKey = "has_seen_onboarding"
}
