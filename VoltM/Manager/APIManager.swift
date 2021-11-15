//
//  AP.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class APIManager {
    class func userRegister(fname: String, lname: String, email: String, password: String, phone: String, address: String , latitude: String, longitude: String, image: String,completion: @escaping(Result<SignUpResponse, Error>) -> Void) {
        request(APIRouter.userRegister(fname, lname, email, password, phone, address ,latitude, longitude, image)) { (response) in
            completion(response)
        }
    }
    class func userLogin( email: String, password: String, completion: @escaping(Result<SignUpResponse, Error>) -> Void) {
        request(APIRouter.userLogin(email, password)) { (response) in
            completion(response)
        }
    }
    class func getAllCountries(completion: @escaping(Result<CountryResponse, Error>) -> Void ) {
        request(APIRouter.countries) { (response) in
            completion(response)
        }
    }
    class func getAllMainCategory(completion: @escaping(Result<CountryResponse, Error>) -> Void ) {
        request(APIRouter.getAllMainCategories) { (response) in
            completion(response)
        }
    }
    class func getStores(mainCat_id: Int,country_id: Int, completion: @escaping(Result<StoreResponse, Error>) -> Void) {
        request(APIRouter.getStores(mainCat_id, country_id)) { (response) in
            completion(response)
        }
    }
    class func getStoresCategory(store_id: Int, completion: @escaping(Result<StoresCategoryResponse, Error>) -> Void) {
        request(APIRouter.getStoreCategory(store_id)) { (response) in
            completion(response)
        }
    }
    class func getStoresSubCategory(parent_id: Int, completion: @escaping(Result<StoresCategoryResponse, Error>) -> Void) {
        request(APIRouter.getStoreSubCategory(parent_id)) { (response) in
            completion(response)
        }
    }
    class func searchStores(storeName: String,country_id: Int, completion: @escaping(Result<StoreResponse, Error>) -> Void) {
        request(APIRouter.searchStores(storeName, country_id)) { (response) in
            completion(response)
        }
    }
    class func searchCatStores(categoryName: String,store_id: Int, completion: @escaping(Result<StoresCategoryResponse, Error>) -> Void) {
        request(APIRouter.searchCatStores(categoryName, store_id)) { (response) in
            completion(response)
        }
    }
    class func searchSubCatStores(subCategoryName: String,parent_id: Int, completion: @escaping(Result<StoresCategoryResponse, Error>) -> Void) {
        request(APIRouter.searchSubCatStores(subCategoryName, parent_id)) { (response) in
            completion(response)
        }
    }
    class func getProducts(subCategory_id: Int, completion: @escaping(Result<ProductResponse, Error>) -> Void) {
        request(APIRouter.getProducts(subCategory_id)) { (response) in
            completion(response)
        }
    }
    class func searchProducts(productName: String,subCategory_id: Int, completion: @escaping(Result<ProductResponse, Error>) -> Void) {
        request(APIRouter.searchProducts(productName,subCategory_id)) { (response) in
            completion(response)
        }
    }
    class func sendReview( rate: String, value: String, product_id: Int, user_id: String, completion: @escaping(Result<ReviewResponse, Error>) -> Void) {
        request(APIRouter.sendReview(rate,value,product_id,user_id)) { (response) in
            completion(response)
        }
    }
    class func uploadPhoto(image: UIImage, completion: @escaping (_ error: Error?, _ upImage: uploadImage?)-> Void){

        AF.upload(multipartFormData: { (form: MultipartFormData) in

            if let data = image.jpegData(compressionQuality: 0.75) {
                form.append(data, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            }
        }, to: "https://voltm7.com/api/uploadImage", usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: nil).response {
            response in
            guard response.error == nil else {
                print(response.error!)

                return
            }

            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }

            do {


                let decoder = JSONDecoder()
                let img = try decoder.decode(uploadImage.self, from: data)

                completion(nil, img)
            } catch let error {
                completion(response.error, nil)
            }
        }
    }
    
}

extension APIManager{
    
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
        .responseJSON { response in
            print(response)
        }
    }
    private static func request1(_ urlConvertible: URLRequestConvertible, completion:  @escaping (_ error: Error?,_ data: Any) -> ()) {
        
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).response { (response: AFDataResponse) in
            print("ok1")
        }
        .responseJSON { response in
            print(response)
            completion(nil, response)
        }
    }
}
