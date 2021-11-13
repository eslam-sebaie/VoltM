//
//  Auth.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/12/21.
//

import Foundation
struct uploadImage: Decodable {
    var data: String
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
struct SignUpResponse: Codable {
    let data: SignUpInfo?
    let message, token: String
    let status: Bool
}

// MARK: - DataClass
struct SignUpInfo: Codable {
    let fname, lname, email, phone, password: String?
    let address, latitude, longitude, image: String?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case fname, lname, email, password, phone, address, latitude, longitude, image
        case id
    }
}

struct CountryResponse: Codable {
    let data: [CountryInfo]?
    let status: Bool
    let message: String
}

// MARK: - Datum
struct CountryInfo: Codable {
    let id: Int?
    let name: String?
}



