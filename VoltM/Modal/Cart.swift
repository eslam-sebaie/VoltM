//
//  Cart.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/21/21.
//

import Foundation
struct CartResponse: Codable {
    let data: CartInfo?
    let message: String
    let status: Bool
}

// MARK: - DataClass
struct CartInfo: Codable {
    let productID, userID, storeID, qty: Int?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case userID = "user_id"
        case storeID = "store_id"
        case qty, id
    }
}


struct getCartResponse: Codable {
    let data: [getCartInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct getCartInfo: Codable {
    let id, cartID, productID, qty: Int
    let createdAt, updatedAt: String?
    let product: ProductInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case cartID = "cart_id"
        case productID = "product_id"
        case qty
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case product
    }
}

