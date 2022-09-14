//
//  UserDefaultsExt.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import Foundation
extension UserDefaults {
    enum UserDefaultKeys: String {
        case accessToken
        case refreshToken
    }
    
    func setRefreshToken(value: String?) {
        set(value, forKey: UserDefaultKeys.refreshToken.rawValue)
        synchronize()
    }
    
    func getRefreshToken() -> String {
        if let token = string(forKey: UserDefaultKeys.refreshToken.rawValue) {
            return token
        }
        return ""
    }
    
    func setAccessToken(value: String?) {
        set(value, forKey: UserDefaultKeys.accessToken.rawValue)
        synchronize()
    }
    
    func getAccessToken() -> String {
        if let token = string(forKey: UserDefaultKeys.accessToken.rawValue) {
            return token
        }
        return ""
    }
}
