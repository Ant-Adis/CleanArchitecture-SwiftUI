//
//  XCTestCaseExt.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import Foundation
import XCTest

extension XCTestCase {
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        waitForExpectations(timeout: duration)
    }
}
