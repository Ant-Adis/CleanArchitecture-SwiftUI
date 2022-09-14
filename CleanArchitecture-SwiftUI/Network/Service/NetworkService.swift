//
//  NetworkService.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 29.03.2022..
//

import Foundation
import Combine

struct NetworkClient {
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension URLRequest {
    mutating func setAuthHeader() {
        let bearer = "Bearer "
        let accessToken = UserDefaults.standard.getAccessToken()
        let value = bearer + accessToken
        setValue(value, forHTTPHeaderField: "Authorization")
    }
    
    mutating func setContentType() {
        addValue(RequestContentType.json.rawValue, forHTTPHeaderField: RequestContentType.contentType.rawValue)
    }
}

enum HTTPMethod: String {
    case post   = "POST"
    case put    = "PUT"
    case get    = "GET"
    case delete = "DELETE"
    case patch  = "PATCH"
}

enum RequestContentType: String {
    case test         = "text/plain"
    case urlencoded   = "application/x-www-form-urlencoded"
    case json        = "application/json"
    case contentType  = "Content-Type"
    case none
}

struct RequestHeaders {
    var field: String
    var value: String
    
    public init(field: String, value: String) {
        self.field = field
        self.value = value
    }
    
    func add(to request: inout NSMutableURLRequest) {
        request.addValue(value, forHTTPHeaderField: field)
    }
}
