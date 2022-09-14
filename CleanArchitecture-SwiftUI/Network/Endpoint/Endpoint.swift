//
//  Endpoint.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 29.03.2022..
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
    
    private let scheme = "https"
    private let host = "demo.learnio.info"
    private let api = "/api/"
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = api + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        
        return url
    }
}

extension Endpoint {
    static var login: Self {
        Endpoint(path: "auth/login")
    }
    
    static func user(by email: String) -> Self {
        Endpoint(path: "user/getByEmail/\(email)")
    }
}
