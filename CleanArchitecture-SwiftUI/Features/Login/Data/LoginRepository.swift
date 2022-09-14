//
//  LoginRepository.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import Foundation
import Combine

//final class LoginRepository: LoginRepositoryProtocol {
//    private var remoteRepository: LoginRemoteRepository
//    
//    init(remoteRepository: LoginRemoteRepository = LoginRemoteRepository()) {
//        self.remoteRepository = remoteRepository
//    }
//    
//    func login(_ params: LoginParameters) -> AnyPublisher<Login, Error> {
//        return remoteRepository.login(params).map { $0.toDomain() }.eraseToAnyPublisher()
//    }
//    
//    func getUserBy(_ email: String) -> AnyPublisher<User, Error> {
//        return remoteRepository.getUserBy(email).map { $0.toDomain() }.eraseToAnyPublisher()
//    }
//}

final class LoginRepository: LoginRepositoryProtocol {
//    private var remoteRepository: LoginRemoteRepository
//    
//    init(remoteRepository: LoginRemoteRepository = LoginRemoteRepository()) {
//        self.remoteRepository = remoteRepository
//    }
    
    func login(_ params: LoginParameters) -> AnyPublisher<Login, Error> {
        
        return LoginRequests.login(with: params).map { $0.toDomain() }.eraseToAnyPublisher()
    }
    
    func getUserBy(_ email: String) -> AnyPublisher<User, Error> {
        return LoginRequests.getUser(by: email).map { $0.toDomain() }.eraseToAnyPublisher()
    }
}
