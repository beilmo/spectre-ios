//
//  Predicate.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import Foundation

protocol AsyncPredicate {
    associatedtype InputType

    func evaluate(with object: InputType, queue: DispatchQueue, completion: @escaping (_ matches: Bool) -> Void)
}

protocol Predicate: AsyncPredicate {
    func evaluate(with object: InputType) -> Bool
}

extension Predicate {
    private var innerQueue: DispatchQueue {
        return DispatchQueue(label: "com.example.predicate", qos: .background, attributes: .concurrent)
    }

    func evaluate(with object: InputType, queue: DispatchQueue = .main, completion: @escaping (Bool) -> Void) {
        innerQueue.async {
            let result = self.evaluate(with: object)

            queue.async {
                completion(result)
            }
        }
    }
}
