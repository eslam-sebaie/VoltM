//
//  Offer.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/4/21.
//

import Foundation
struct OfferResponse: Codable {
    let data: [OfferInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct OfferInfo: Codable {
    let id: Int
    let image: String
    let name: ProductLocalize?
    let price: Int
    let desc: ProductLocalize
    let offer: String
    let newPrice, categoryID, subcategoryID, storeID: Int?
    let qty, reviewNumber, reviewRate: Int?
    let store: StoreInfo?

    enum CodingKeys: String, CodingKey {
        case id, image, name, price, desc, offer
        case newPrice = "new_price"
        case categoryID = "category_id"
        case subcategoryID = "subcategory_id"
        case storeID = "store_id"
        case qty
        case reviewNumber = "review_number"
        case reviewRate = "review_rate"
        case store
    }
}

struct OfferResponse1: Codable {
    let data: [ProductInfo]?
    let message: String
    let status: Bool
}
