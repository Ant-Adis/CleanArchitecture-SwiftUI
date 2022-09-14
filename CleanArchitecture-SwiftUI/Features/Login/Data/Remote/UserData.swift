//
//  UserData.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import Foundation

struct UserData: Decodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var uid: String?
    var email: String?
    var status: String?
    var jobId: Int?
    var companyId: Int?
    var profileImage: String?
    var personnelNumber: String?
    var collectedPoints: Int?
    var createdAt: String?
    var updatedAt: String?
    var pickedImage: String?
    var departmentId: Int?
}

extension UserData: DomainModel {
    typealias DomainModelType = User
    
    func toDomain() -> User {
        User(id: id,
             firstName: firstName,
             lastName: lastName,
             uid: uid,
             email: email,
             status: status,
             jobId: jobId,
             companyId: companyId,
             profileImage: profileImage,
             personnelNumber: personnelNumber,
             collectedPoints: collectedPoints,
             createdAt: createdAt,
             updatedAt: updatedAt,
             pickedImage: pickedImage,
             departmentId: departmentId)
    }
}
