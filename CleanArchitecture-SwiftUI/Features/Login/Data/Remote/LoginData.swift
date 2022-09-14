//
//  LoginData.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import Foundation

struct LoginData: Decodable {
    var accessToken: String?
    var refreshToken: String?
}

extension LoginData: DomainModel {
    typealias DomainModelType = Login
    
    func toDomain() -> Login {
        Login(accessToken: accessToken,
              refreshToken: refreshToken)
    }
}
