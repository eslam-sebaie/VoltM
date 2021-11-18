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


struct FavoriteResponse: Codable {
    let data: FavoriteInfo?
    let status: Bool
    let message: String
}

// MARK: - DataClass
struct FavoriteInfo: Codable {
    let productID: Int?
    let userID,id: Int

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case productID = "product_id"
        case id
    }
}

struct getFavResponse: Codable {
    let data: [getFavInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct getFavInfo: Codable {
    let id, userID, productID: Int?
    let product: ProductInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case productID = "product_id"
        case product
    }
}

// MARK: - Product
struct ProductFavResponse: Codable {
    let id: Int
    let image: String
    let name: ProductLocalize?
    let price: Int
    let desc: ProductLocalize?
    let offer, newPrice: Int?
    let categoryID, subcategoryID, storeID: Int
    let createdAt, updatedAt: String
    let qty: Int

    enum CodingKeys: String, CodingKey {
        case id, image, name, price, desc, offer
        case newPrice = "new_price"
        case categoryID = "category_id"
        case subcategoryID = "subcategory_id"
        case storeID = "store_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case qty
    }
}

