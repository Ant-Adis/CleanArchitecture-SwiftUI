//
//  DomainModel.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 01.04.2022..
//

import Foundation

protocol DomainModel {
    associatedtype DomainModelType
    
    func toDomain() -> DomainModelType
}
