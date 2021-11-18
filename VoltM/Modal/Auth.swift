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
    let message, token: String?
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



struct userResponse: Codable {
    let data: SignUpInfo?
    let message: String
    let status: Bool
}

struct allCountryResponse: Codable {
    let data: [allCountryInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct allCountryInfo: Codable {
    let id: Int
    let name: countryLocalize?
    let image, address: String?
    let countryID, cityID, mainCatID: Int?
    let createdAt, updatedAt: String?
    let country, city: countryDetails?

    enum CodingKeys: String, CodingKey {
        case id, name, image, address
        case countryID = "country_id"
        case cityID = "city_id"
        case mainCatID = "mainCat_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case country, city
    }
}

// MARK: - City
struct countryDetails: Codable {
    let id: Int
    let name: String
}

// MARK: - Name
struct countryLocalize: Codable {
    let en, ar: String
}

