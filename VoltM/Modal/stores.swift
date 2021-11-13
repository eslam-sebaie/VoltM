//
//  stores.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/13/21.
//

import Foundation
struct StoreResponse: Codable {
    let data: [StoreInfo]?
    let status: Bool
    let message: String
}

// MARK: - Datum
struct StoreInfo: Codable {
    let id: Int
    let name: StoreLocalize?
    let image, address: String?
    let countryID, cityID, mainCatID: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, address
        case countryID = "country_id"
        case cityID = "city_id"
        case mainCatID = "mainCat_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Name
struct StoreLocalize: Codable {
    let en, ar: String?
}


struct StoresCategoryResponse: Codable {
    let data: [StoresCategoryInfo]?
    let status: Bool
    let message: String
}

// MARK: - Datum
struct StoresCategoryInfo: Codable {
    let id: Int
    let image: String?
    let name, desc: StoresCategoryLocalize
}

// MARK: - Desc
struct StoresCategoryLocalize: Codable {
    let en, ar: String
}
