//
//  LoginRequest.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 29.03.2022..
//

import Foundation
import Combine

enum LoginRequests {
    
    static let client = NetworkClient()
    
    static func login(with parameters: LoginParameters) -> AnyPublisher<LoginData, Error> {
        let endpoint = Endpoint.login
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setContentType()
        do {
            let body = try JSONEncoder().encode(parameters)
            request.httpBody = body
        } catch {
            print(error.localizedDescription)
        }
        
        return client.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func getUser(by email: String) -> AnyPublisher<UserData, Error> {
        let endpoint = Endpoint.user(by: email)
        var request = URLRequest(url: endpoint.url)
        request.setContentType()
        request.setAuthHeader()
        
        return client.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
