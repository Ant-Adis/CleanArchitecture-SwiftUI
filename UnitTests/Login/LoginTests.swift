//
//  LoginTests.swift
//  CleanArchitecture-SwiftUITests
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import XCTest
@testable import CleanArchitecture_SwiftUI

class LoginTests: XCTestCase {
    private var viewModel: LoginViewModel!
    private var useCase = LoginUseCaseMock()
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel(useCase: useCase)
        viewModel.login()
        wait(for: 0.1)
    }
    
    func testUserName() {
        XCTAssertEqual(viewModel.userName, "Ant")
    }
}
