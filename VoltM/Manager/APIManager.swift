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
//    class func userRegister(name: String, emailNumber: String, address: String, dateOfBirth: String, gender: String, phoneNumber: String ,password: String, lat: String, lng: String, points: String,completion: @escaping(Result<SignUpResponse, Error>) -> Void) {
//        request(APIRouter.userRegister(name, emailNumber, address, dateOfBirth, gender, phoneNumber ,password, lat, lng, points)) { (response) in
//            completion(response)
//        }
//    }
  
//    class func uploadPhoto(image: UIImage, completion: @escaping (_ error: Error?, _ upImage: uploadImage?)-> Void){
//
//        AF.upload(multipartFormData: { (form: MultipartFormData) in
//
//            if let data = image.jpegData(compressionQuality: 0.75) {
//                form.append(data, withName: "storeFile", fileName: "storeFile.jpeg", mimeType: "storeFile/jpeg")
//            }
//        }, to: "http://penprnt.com/penprnt/api/uploadImage", usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: nil).response {
//            response in
//            guard response.error == nil else {
//                print(response.error!)
//
//                return
//            }
//
//            guard let data = response.data else {
//                print("didn't get any data from API")
//                return
//            }
//
//            do {
//
//
//                let decoder = JSONDecoder()
//                let img = try decoder.decode(uploadImage.self, from: data)
//
//                completion(nil, img)
//            } catch let error {
//                completion(response.error, nil)
//            }
//        }
//    }
    
}

extension APIManager{
    
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
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
