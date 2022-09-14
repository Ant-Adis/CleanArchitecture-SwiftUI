//
//  LoginRepositoryProtocol.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import Foundation
import Combine

protocol LoginRepositoryProtocol {
    func login(_ params: LoginParameters) -> AnyPublisher<Login, Error>
    func getUserBy(_ email: String) -> AnyPublisher<User, Error>
}
