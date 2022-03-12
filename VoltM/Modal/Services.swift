//
//  Services.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/9/21.
//

import Foundation
struct ServiceResponse: Codable {
    let data: [ServiceInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct ServiceInfo: Codable {
    let id: Int
    let name: ProductLocalize
    let image: String
    let price: Double?
}


struct ServiceOrder: Codable {
    let data: [ServiceOrderInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct ServiceOrderInfo: Codable {
    let id, repairCategoryID, userID: Int
    let status: Bool
    let notes, createdAt, updatedAt: String
    let repairCategory: RepairCategory

    enum CodingKeys: String, CodingKey {
        case id
        case repairCategoryID = "repairCategory_id"
        case userID = "user_id"
        case status, notes
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case repairCategory = "repair_category"
    }
}

// MARK: - RepairCategory
struct RepairCategory: Codable {
    let id: Int
    let name: ProductLocalize
    let price: Double
    let image: String
}


struct allServicesResponse: Codable {
    let data: [allServicesInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct allServicesInfo: Codable {
    let id: Int
    let name: Name?
    let image: String
    let price, parentID: String?
    let countryID, cityID: Int
    let country: Country

    enum CodingKeys: String, CodingKey {
        case id, name, image, price
        case parentID = "parent_id"
        case countryID = "country_id"
        case cityID = "city_id"
        case country
    }
}

// MARK: - Country
struct Country: Codable {
    let id: Int
    let name: String
}

// MARK: - Name
struct Name: Codable {
    let en, ar: String
}
