//
//  SignUpView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit
import CoreLocation
import MapKit

class SignUpVC: UIViewController, sendingAddress {
    func send(address: String) {
        signUpView.addressTF.text = address
    }
    @IBOutlet var signUpView: SignUpView!
    var imagePicker = UIImagePickerController()
    var storeImg: String?
    var lat = 0.0
    var lng = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        signUpView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.signUpVC)
        return signUpVC
    }
    
    @IBAction func eyePressed(_ sender: UIButton) {
        if sender.isSelected {
            signUpView.passwordTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            signUpView.passwordTF.isSecureTextEntry = false
            sender.isSelected = true
        }
    }
    
    @IBAction func uploadImagePressed(_ sender: Any) {
        setImagePicker()
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = sb.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        mapVC.delegate = (self as sendingAddress)
        self.present(mapVC ,animated: true, completion: nil)
    }
    @IBAction func signUpPressed(_ sender: Any) {
        guard let img = storeImg , img != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.uploadYourImage.localized)
            return
        }
        
        guard let fname = signUpView.fNameTF.text , fname != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterFirstName.localized)
            return
        }
        guard let lname = signUpView.lNameTF.text , lname != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterLastName.localized)
            return
        }
        guard let email = signUpView.emailTF.text , email != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.wrongEmail.localized)
            return
        }
        guard let pass = signUpView.passwordTF.text , pass != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterPassword.localized)
            return
        }
        guard let phone = signUpView.phoneTF.text , phone != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterPhone.localized)
            return
        }
        guard let address = signUpView.addressTF.text , address != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterAddress.localized)
            return
        }
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = self.signUpView.addressTF.text ?? ""
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, err) in
            if response == nil {
                
                self.show_Alert(L10n.sorry.localized,L10n.noResultFound.localized)
                
            }
            else {
                
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                self.lat = Double(latitude!)
                self.lng = Double(longitude!)
                let response = Validation.shared.validate(values: (type: Validation.ValidationType.email, email))
                
                switch response {
                case .failure(_, let message):
                    self.show_Alert(L10n.sorry.localized, message.localized())
                case .success:
                    self.view.showLoader()
                    APIManager.userRegister(fname: fname, lname: lname, email: email, password: pass, phone: phone, address: address, latitude: String(self.lat), longitude: String(self.lng), image: img) { (response) in
                            switch response {
                            case .failure(let err):
                                print(err)
                                self.show_Alert(L10n.sorry.localized, L10n.emailOrPhoneAreAleardyToken.localized)
                                self.view.hideLoader()
                            case .success(let result):
                                print(result)
                                self.view.hideLoader()
                                let signIn = SignInVC.create()
                                self.present(signIn, animated: true, completion: nil)
                            }
                        }
                }
            }
        }
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let signIn = SignInVC.create()
        self.present(signIn, animated: true, completion: nil)
    }
    

}
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        signUpView.userImage.image = image
        self.signUpView.showLoader()
        APIManager.uploadPhoto(image: image!) { (err, img) in
            self.storeImg = img?.data ?? ""
            self.signUpView.hideLoader()
            
        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}

