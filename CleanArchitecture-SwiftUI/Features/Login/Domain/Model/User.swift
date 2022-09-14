//
//  User.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 30.03.2022..
//

import Foundation

struct User: Decodable {
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
