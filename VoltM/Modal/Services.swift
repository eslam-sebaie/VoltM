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
    let price: Int?
}
