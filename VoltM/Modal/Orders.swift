struct OrderResponse: Codable {
    let data: [OrderInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct OrderInfo: Codable {
    let id, userID: Int
    let orderNumber: String
    let totalPrice: Int
    let status: Bool
    let createdAt: String
    let details: [ProductDetail]?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case orderNumber, totalPrice, status
        case createdAt = "created_at"
        case details
    }
}

// MARK: - Detail
struct ProductDetail: Codable {
    let id, orderID, cartID: Int
    let cart: OrderCart?

    enum CodingKeys: String, CodingKey {
        case id
        case orderID = "order_id"
        case cartID = "cart_id"
        case cart
    }
}

// MARK: - Cart
struct OrderCart: Codable {
    let id, userID, storeID: Int
    let cartDetails: [CartDetail]?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case storeID = "store_id"
        case cartDetails = "cart_details"
    }
}

// MARK: - CartDetail
struct CartDetail: Codable {
    let id, cartID, productID, qty: Int
    let product: ProductInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case cartID = "cart_id"
        case productID = "product_id"
        case qty, product
    }
}


struct deliveryResponse: Codable {
    let data: [deliveryInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct deliveryInfo: Codable {
    let id, sameCityPrice, diffCityPrice: Int?
}
struct TimeResponse: Codable {
    let data: [TimeInfo]?
    let message: String
    let status: Bool
}

// MARK: - Datum
struct TimeInfo: Codable {
    let id, estimationTimeSameCity, estimationTimeDiffCity: Int
}
