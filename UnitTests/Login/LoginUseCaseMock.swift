//
//  LoginUseCaseMock.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import Foundation
import Combine

final class LoginUseCaseMock: LoginUseCaseProtocol {
    func login(_ params: LoginParameters) -> AnyPublisher<Login, Error> {
        return Future<Login, Error> { promise in
            promise(.success(self.loginData))
        }.eraseToAnyPublisher()
    }
    
    func getUserBy(_ email: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            promise(.success(self.userData))
        }.eraseToAnyPublisher()
    }
    
    let loginData = Login(accessToken: "qwertyuiop", refreshToken: "qwertyuiop")
    let userData = User(id: 0,
                        firstName: "Ant",
                        lastName: "Colony",
                        uid: String(),
                        email: "info@antcolony.io",
                        status: String(),
                        jobId: 0,
                        companyId: 0,
                        profileImage: String(),
                        personnelNumber: String(),
                        collectedPoints: 0,
                        createdAt: String(),
                        updatedAt: String(),
                        pickedImage: String(),
                        departmentId: 0)
    
}
