//
//  APIRouter.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import Foundation

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // The endpoint name
    // MARK:- Registration
    case userRegister(_ fname: String,_ lname: String, _ email: String,_ password: String, _ phone: String, _ address: String ,_ latitude: String, _ longitude: String, _ image: String)
    case userLogin(_ email: String,_ password: String)
    case countries
    case allCountries
    case getAllMainCategories
    case getStores(_ mainCat_id: Int,_ country_id: Int)
    case getStoreCategory(_ store_id: Int)
    case getStoreSubCategory(_ parent_id: Int)
    case searchStores(_ storeName: String,_ country_id: Int)
    case searchCatStores(_ categoryName: String,_ store_id: Int)
    case searchSubCatStores(_ subCategoryName: String,_ parent_id: Int)
    case getProducts(_ subcategory_id: Int)
    case searchProducts(_ productName: String,_ subcategory_id: Int)
    case sendReview(_ rate: String,_ value: String, _ product_id: Int, _ user_id: String)
    case getReview(_ product_id: Int)
    case getUserData(_ id: Int)
    case updateUserData(_ id: Int, _ fname: String,_ lname: String, _ email: String,_ password: String, _ phone: String, _ address: String ,_ latitude: String, _ longitude: String, _ image: String)
    case addFavorite( _ user_id: Int, _ product_id: Int)
    case getFavorite( _ user_id: Int)
    case deleteFavorite( _ user_id: Int, _ product_id: Int)
    case addCart( _ user_id: Int, _ store_id: Int, _ cart: [[String:AnyObject]])
    case getCart(_ user_id: Int)
    case deleteCart(_ cart_id: Int, _ product_id: Int, _ id: Int)
    case confirmCart(_ cart_id: Int, _ user_id: Int)
    case getOrders(_ user_id: Int)
    case getCity(_ country_id: Int)
    case getDelivery(_ country_id: Int)
    case getTime(_ country_id: Int)
    case getOffer(_ country_id: Int)
    case getServices(_ country_id: Int, _ city_id: Int)
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case .userRegister, .userLogin, .sendReview, .updateUserData, .addFavorite, .deleteFavorite, .addCart, .deleteCart, .confirmCart:
            return .post
        case .countries, .getAllMainCategories, .getStores, .getStoreCategory, .getStoreSubCategory, .searchStores, .searchCatStores, .searchSubCatStores, .getProducts, .searchProducts, .getReview, .getUserData, .allCountries, .getFavorite, .getCart, .getOrders, .getCity, .getDelivery, .getTime, .getOffer, .getServices:
            return .get
            
        default:
            return .delete
        }
        
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        // MARK: - registerParameters
        case .userRegister(let fname, let lname, let email, let password , let phone, let address ,let latitude, let longitude, let image):
            return ["fname": fname, "lname": lname, "email": email, "password": password, "phone": phone,"address": address, "latitude": latitude, "longitude": longitude, "image": image]
        case .userLogin(let email, let password):
            return ["email": email, "password": password]
        case .getStores(let mainCat_id, let country_id):
            return ["mainCat_id": mainCat_id, "country_id": country_id]
        case .getStoreCategory(let store_id):
            return ["store_id": store_id]
        case .getStoreSubCategory(let parent_id):
            return ["parent_id": parent_id]
        case .searchStores(let storeName, let country_id):
            return ["storeName": storeName, "country_id": country_id]
        case .searchCatStores(let categoryName, let store_id):
            return ["categoryName": categoryName, "store_id": store_id]
        case .searchSubCatStores(let subCategoryName, let parent_id):
            return ["subCategoryName": subCategoryName, "parent_id": parent_id]
        case .getProducts(let subcategory_id):
            return ["subcategory_id": subcategory_id]
        case .searchProducts(let productName, let subcategory_id):
            return ["productName": productName, "subcategory_id": subcategory_id]
        case .sendReview(let rate,let value, let product_id, let user_id):
            return ["rate": rate, "value": value, "product_id": product_id, "user_id": user_id]
        case .getReview(let product_id):
            return ["product_id": product_id]
        case .getUserData(let id):
            return ["id": id]
        case .updateUserData(let id ,let fname, let lname, let email, let password , let phone, let address ,let latitude, let longitude, let image):
            return ["id": id, "fname": fname, "lname": lname, "email": email, "password": password, "phone": phone,"address": address, "latitude": latitude, "longitude": longitude, "image": image]
        case .addFavorite(let user_id,let product_id):
            return ["user_id": user_id, "product_id": product_id]
        case .getFavorite(let user_id):
            return ["user_id": user_id]
        case .deleteFavorite(let user_id,let product_id):
            return ["user_id": user_id, "product_id": product_id]
        case .addCart(let user_id,let store_id, let cart):
            return ["user_id": user_id, "store_id": store_id, "cart": cart]
        case .getCart(let user_id):
            return ["user_id": user_id]
        case .deleteCart(let cart_id, let product_id, let id):
            return ["cart_id": cart_id, "product_id":product_id, "id": id]
        case .confirmCart(let cart_id,let user_id):
            return ["cart_id": cart_id, "user_id": user_id]
        case .getOrders(let user_id):
            return ["user_id": user_id]
        case .getCity(let country_id):
            return ["country_id": country_id]
        case .getDelivery(let country_id):
            return ["country_id": country_id]
        case .getTime(let country_id):
            return ["country_id": country_id]
        case .getOffer(let country_id):
            return ["country_id": country_id]
        case .getServices(let country_id, let city_id):
            return ["country_id": country_id, "city_id": city_id]
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        // MARK: - PathRegister
        case .userRegister:
            return URLs.userSignUp
        case .userLogin:
            return URLs.login
        case .countries:
            return URLs.Countries
        case .allCountries:
            return URLs.allCountriesSrores
        case .getAllMainCategories:
            return URLs.MainCategories
        case.getStores:
            return URLs.getAllStores
        case.getStoreCategory:
            return URLs.getAllCategories
        case.getStoreSubCategory:
            return URLs.getAllSubCategories
        case.searchStores:
            return URLs.searchStore
        case.searchCatStores:
            return URLs.searchCat
        case.searchSubCatStores:
            return URLs.searchSubCat
        case.getProducts:
            return URLs.getProducts
        case.searchProducts:
            return URLs.searchProducts
        case .sendReview:
            return URLs.sendReview
        case .getReview:
            return URLs.getReview
        case .getUserData:
            return URLs.getUser
        case .updateUserData:
            return URLs.updateUser
        case .addFavorite:
            return URLs.setFavorite
        case .getFavorite:
            return URLs.getFavorite
        case .deleteFavorite:
            return URLs.deleteFavorite
        case.addCart:
            return URLs.addCart
        case .getCart:
            return URLs.getCart
        case .deleteCart:
            return URLs.deleteCart
        case.confirmCart:
            return URLs.confirmCart
        case .getOrders:
            return URLs.getOrders
        case .getCity:
            return URLs.getCities
        case .getDelivery:
            return URLs.getDelivery
        case .getTime:
            return URLs.getTime
        case .getOffer:
            return URLs.getOffer
        case .getServices:
            return URLs.getServices
            
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        print(urlRequest)
        switch self {
       
        case .countries, .getAllMainCategories, .getStores, .getStoreCategory, .getStoreSubCategory, .searchStores, .searchCatStores, .searchSubCatStores, .getProducts, .searchProducts, .sendReview, .getReview, .getUserData, .updateUserData, .allCountries, .addFavorite, .getFavorite, .deleteFavorite, .addCart, .getCart, .deleteCart, .confirmCart, .getOrders, .getCity, .getDelivery, .getTime, .getOffer, .getServices:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().Token ?? "")",
                forHTTPHeaderField: HeaderKeys.Authorization)
        default:
            break
        }
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
                
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
        
            return jsonData
        } catch {
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}

