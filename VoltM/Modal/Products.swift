//
//  Products.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/15/21.
//

import Foundation
struct ProductResponse: Codable {
    let data: [ProductInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct ProductInfo: Codable {
    let id: Int
    let name: ProductLocalize?
    let image: String?
    let price: Int?
    let newPrice: Int?
    let desc: ProductLocalize?
    let offer: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, image, price
        case newPrice = "new_price"
        case desc, offer
    }
}

// MARK: - Desc
struct ProductLocalize: Codable {
    let en, ar: String
}

struct ReviewResponse: Codable {
    let data: ReviewInfo?
    let status: Bool
    let message: String
}

// MARK: - DataClass
struct ReviewInfo: Codable {
    let rate, value, userID: String?
    let productID, id: Int?

    enum CodingKeys: String, CodingKey {
        case rate, value
        case userID = "user_id"
        case productID = "product_id"
        case id
    }
}

struct GetReviewResponse: Codable {
    let data: [GetReviewInfo]?
    let totalReviewsNumber: Int?
    let totalReviewsRate: Double?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct GetReviewInfo: Codable {
    let id: Int
    let rate, value: String
    let userID, productID: Int
    let createdAt: String
    let user: UserResponse

    enum CodingKeys: String, CodingKey {
        case id, rate, value
        case userID = "user_id"
        case productID = "product_id"
        case createdAt = "created_at"
        case user
    }
}

// MARK: - User
struct UserResponse: Codable {
    let id: Int
    let fname, lname: String
    let image: String
    let email: String
}
