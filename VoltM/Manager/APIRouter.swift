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
//    case userRegister(_ name: String,_ emailNumber: String, _ address: String,_ dateOfBirth: String, _ gender: String, _ phoneNumber: String ,_ password: String, _ lat: String, _ lng: String, _ points: String)
   
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self {
//        case .userRegister:
//            return .post
        
    
        default:
            return .delete
        }
        
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        // MARK: - registerParameters
//        case .userRegister(let name, let emailNumber, let address, let dateOfBirth , let gender, let phoneNumber ,let password, let lat, let lng, let points):
//            return [ParameterKeys.name: name, ParameterKeys.email: emailNumber, ParameterKeys.address: address, ParameterKeys.dateOfBirth: dateOfBirth, ParameterKeys.gender: gender,ParameterKeys.phone: phoneNumber, ParameterKeys.password: password, "lat": lat, "lng": lng, "points": points]
       
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        // MARK: - PathRegister
//        case .userRegister:
//            return URLs.userSignUp
        
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        print(urlRequest)
        
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

