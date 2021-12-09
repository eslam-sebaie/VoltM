//
//  UpdateAddressVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit
import CoreLocation
import MapKit
class UpdateAddressVC: UIViewController, sendingAddress, UIPickerViewDelegate, UIPickerViewDataSource {
    func send(address: String) {
        updateAddressView.addressTF.text = address
    }
    @IBOutlet var updateAddressView: UpdateAddressView!
    var userInfo = SignUpInfo(fname: "", lname: "" , email: "",phone: "",password: "",address: "", latitude: "",longitude: "", image: "", id: 0)
    var lat = 0.0
    var lng = 0.0
    var img = ""
    var imagePicker = UIImagePickerController()
    var pickerView = UIPickerView()
    var cityInfo = [CountryInfo]()
    var cityID = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAddressView.updateUI()
        self.updateAddressView.userName.text = "\(self.userInfo.fname ?? "") \(self.userInfo.lname ?? "")"
        self.updateAddressView.userImage.sd_setImage(with: URL(string: self.userInfo.image ?? ""), completed: nil)
        self.updateAddressView.addressTF.text = self.userInfo.address ?? ""
        self.updateAddressView.countryTF.text = UserDefaultsManager.shared().country
        self.updateAddressView.cityTF.text = UserDefaultsManager.shared().serviceCity ?? ""
        self.img = self.userInfo.image ?? ""
        imagePicker.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        self.updateAddressView.cityTF.inputView = pickerView

    }
    override func viewWillAppear(_ animated: Bool) {
        getCity()
    }
    func getCity() {
        self.view.showLoader()
        APIManager.getCity(country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                self.cityInfo = result.data ?? []
                self.view.hideLoader()
            }
        }
    }
    class func create() -> UpdateAddressVC {
        let updateAddressVC: UpdateAddressVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateAddressVC)
        return updateAddressVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func logOutPressed(_ sender: Any) {
        let signIn = WelcomeVC.create()
        UserDefaultsManager.shared().Token = ""
        UserDefaultsManager.shared().Email = ""
        UserDefaultsManager.shared().phone = ""
        UserDefaultsManager.shared().userId = 0
        UserDefaultsManager.shared().Password = ""
        UserDefaultsManager.shared().serviceCity = ""
        UserDefaultsManager.shared().serviceCityId = 0
        self.present(signIn, animated: true, completion: nil)
    }
    
    @IBAction func addressChange(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = sb.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        mapVC.delegate = (self as sendingAddress)
        self.present(mapVC ,animated: true, completion: nil)
    }
    
    @IBAction func imagePressed(_ sender: Any) {
        setImagePicker()
    }
    
    @IBAction func saveCityPressed(_ sender: Any) {
        guard let city = updateAddressView.cityTF.text , city != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.chooseYourCity.localized)
            return
        }
        UserDefaultsManager.shared().serviceCity = city
        UserDefaultsManager.shared().serviceCityId = self.cityID
        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
        self.present(tabVC, animated: true, completion: nil)
    }
    
    @IBAction func infoPressed(_ sender: Any) {
        let account = UpdateInfoVC.create()
        account.modalPresentationStyle = .fullScreen
        account.modalTransitionStyle = .coverVertical
        self.present(account, animated: true, completion: nil)
    }
    @IBAction func contactPressed(_ sender: Any) {
        let contact = UpdateContactVC.create()
        contact.modalPresentationStyle = .fullScreen
        contact.modalTransitionStyle = .coverVertical
        contact.userInfo = userInfo
        self.present(contact, animated: true, completion: nil)
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        
        guard let address = updateAddressView.addressTF.text , address != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterAddress.localized)
            return
        }
        if updateAddressView.addressTF.text == userInfo.address && userInfo.image == self.img  {
            self.show_Alert(L10n.sorry.localized, L10n.youDidnTUpdateAnyThing.localized)

        }
        else {
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = self.updateAddressView.addressTF.text ?? ""
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
                    self.view.showLoader()
                    UserDefaultsManager.shared().address = address
                    APIManager.updateUser(id: UserDefaultsManager.shared().userId ?? 0,fname: self.userInfo.fname!, lname: self.userInfo.lname!, email: self.userInfo.email ?? "", password: UserDefaultsManager.shared().Password ?? "", phone: self.userInfo.phone!, address: address, latitude: String(self.lat), longitude: String(self.lng), image: self.img) { (response) in
                        switch response {
                        case .failure(let err):
                            print(err)
                            self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                            self.view.hideLoader()
                        case .success(let result):
                            print(result)
                            self.view.hideLoader()
                            
                                let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                                let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                                self.present(tabVC, animated: true, completion: nil)
                            
                        }
                    }
                }
            }
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityInfo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityInfo[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.updateAddressView.cityTF.text = cityInfo[row].name
        self.cityID = cityInfo[row].id ?? 0
    }
    
}
extension UpdateAddressVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        updateAddressView.userImage.image = image
        self.view.showLoader()
        APIManager.uploadPhoto(image: image!) { (err, img) in
            self.img = img?.data ?? ""
            self.view.hideLoader()
            
        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}
