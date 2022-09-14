//
//  LoginUseCase.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import Foundation
import Combine

final class LoginUseCase: LoginUseCaseProtocol {
    private lazy var remoteRepository: LoginRepositoryProtocol = {
        LoginRepository()
    }()
    
    func login(_ params: LoginParameters) -> AnyPublisher<Login, Error> {
        return remoteRepository.login(params)
    }
    
    func getUserBy(_ email: String) -> AnyPublisher<User, Error> {
        remoteRepository.getUserBy(email)
    }
}
