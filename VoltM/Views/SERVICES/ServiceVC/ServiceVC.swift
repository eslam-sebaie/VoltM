//
//  ServiceVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/7/21.
//

import UIKit
import Alamofire

class ServiceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var serviceView: ServiceView!
    var serviceInfo = [ServiceInfo]()
    var imageLoader = ImageLoader()
    var userInfo = SignUpInfo(fname: "", lname: "" , email: "",phone: "",password: "",address: "", latitude: "",longitude: "", image: "", id: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> ServiceVC {
        let serviceVC: ServiceVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.serviceVC)
        return serviceVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let city = UserDefaultsManager.shared().serviceCity, city != "" {
            showAlert1(title: "", massage: L10n.doYouWantToChangeYourCity.localized, present: self, titleBtn: L10n.ok.localized) {
                self.getUser1()
            } completion1: {
                self.getServices()
            }

            
            
        }
        else {
            getUser()
        }
    }
    func getUser(){
        
        self.view.showLoader()
        APIManager.getUserData(id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case.failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
                else {
                    self.userInfo = result.data!
                    
                    self.showAlert(title: L10n.please.localized, massage: L10n.chooseYourCity.localized, present: self, titleBtn: L10n.ok.localized) {
                        let address = UpdateAddressVC.create()
                        address.modalPresentationStyle = .fullScreen
                        address.modalTransitionStyle = .coverVertical
                        address.userInfo = self.userInfo
                        self.present(address, animated: true, completion: nil)
                        self.view.hideLoader()
                    }
                }
            }
        }
    }
    func getUser1(){
        
        self.view.showLoader()
        APIManager.getUserData(id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case.failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
                else {
                    self.userInfo = result.data!
                    
                  
                        let address = UpdateAddressVC.create()
                        address.modalPresentationStyle = .fullScreen
                        address.modalTransitionStyle = .coverVertical
                        address.userInfo = self.userInfo
                        self.present(address, animated: true, completion: nil)
                        self.view.hideLoader()
                    }
                
            }
        }
    }
    func getServices() {
        self.view.showLoader()
        APIManager.getServices(country_id: UserDefaultsManager.shared().countryId ?? 0, city_id: UserDefaultsManager.shared().serviceCityId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    self.serviceInfo = result.data ?? []
                    self.serviceView.serviceTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.serviceInfo = result.data ?? []
                    self.serviceView.serviceTableView.reloadData()
                    self.show_Alert(L10n.sorry.localized, L10n.noServiceFound.localized)
                    self.view.hideLoader()
                }
            }
        }
    }

    @IBAction func searchPressed(_ sender: Any) {
        guard let name = serviceView.searchTF.text , name != "" else {
            show_Alert(L10n.please.localized, L10n.storeName.localized)
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = serviceView.serviceTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServiceTableViewCell
        cell.serviceImage.setCornerRadius(radius: 8)
        imageLoader.obtainImageWithPath(imagePath: serviceInfo[indexPath.row].image) { (image) in
            cell.serviceImage.image = image
            
        }
        if L10n.lang.localized == Language.arabic {
            cell.serviceName.text = serviceInfo[indexPath.row].name.ar
        }
        else {
            cell.serviceName.text = serviceInfo[indexPath.row].name.en
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subService = SubServiceVC.create()
        subService.receiveServiceID = serviceInfo[indexPath.row].id
        self.present(subService, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
