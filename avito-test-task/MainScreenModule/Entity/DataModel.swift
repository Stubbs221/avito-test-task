//
//  DataModel.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import Foundation

enum LoadingState {
    case idle, loading, loaded(Company), failure(NetworkError)
}


struct FetchedData: Codable {
    var company: Company
}

struct Company: Codable {
    var name: String
    var employees: [Employee]
}

struct Employee: Codable {
    var name: String
    var phoneNumber: String
    var skills: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case phoneNumber = "phone_number"
        case skills = "skills"
    }
}


