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
    case getAllMainCategories
    case getStores(_ mainCat_id: Int,_ country_id: Int)
    case getStoreCategory(_ store_id: Int)
    case getStoreSubCategory(_ parent_id: Int)
    case searchStores(_ storeName: String,_ country_id: Int)
    case searchCatStores(_ categoryName: String,_ store_id: Int)
    case searchSubCatStores(_ subCategoryName: String,_ parent_id: Int)
    case getProducts(_ subcategory_id: Int)
    case searchProducts(_ productName: String,_ subcategory_id: Int)
    case sendReview(_ rate: String,_ value: String, _ product_id: Int, _ user_id: Int)
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
        case .userRegister, .userLogin, .sendReview:
            return .post
        case .countries, .getAllMainCategories, .getStores, .getStoreCategory, .getStoreSubCategory, .searchStores, .searchCatStores, .searchSubCatStores, .getProducts, .searchProducts:
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
       
        case .countries, .getAllMainCategories, .getStores, .getStoreCategory, .getStoreSubCategory, .searchStores, .searchCatStores, .searchSubCatStores, .getProducts, .searchProducts, .sendReview:
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

