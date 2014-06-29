//
//  BeIdenticalTo.swift
//  Nimble
//
//  Created by Alex Basson on 6/21/14.
//
//

import Foundation

class BeIdenticalTo: Matcher {
    override func failureMessage(actual: NSObject?) -> String {
        if let unwrappedExpected = expected {
            if let unwrappedActual = actual {
                return NSString(format: "expected '%@' (%p), got '%@' (%p)", unwrappedActual, unwrappedActual, unwrappedExpected, unwrappedExpected)
            } else {
                return NSString(format: "expected '%@' (%p), got nil", unwrappedExpected, unwrappedExpected)
            }
        } else {
            return NSString(format: "cannot expect nil to be identical to anything")
        }
    }

    override func negativeFailureMessage(actual: NSObject?) -> String {
        return NSString(format: "expected subject not to be identical to '%@' (%p)", expected!, expected!)
    }

    override func match(actual: NSObject?) -> Bool {
        if expected == nil { return false }
        return actual === expected
    }
}

extension Prediction {
    func beIdenticalTo(expected: NSObject?) {
        evaluate(BeIdenticalTo(expected))
    }
}
