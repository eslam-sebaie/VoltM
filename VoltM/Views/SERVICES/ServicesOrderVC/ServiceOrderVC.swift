//
//  ServiceOrderVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/14/21.
//

import UIKit

class ServiceOrderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var serviceOrderView: ServiceOrderView!
    var orderInfo = [ServiceOrderInfo]()
    var imageLoader = ImageLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceOrderView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> ServiceOrderVC {
        let serviceOrderVC: ServiceOrderVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.serviceOrderVC)
        return serviceOrderVC
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaultsManager.shared().guest! {
            showAlert1(title: L10n.youAraGuest.localized, massage: L10n.doYouWantToRegister.localized, present: self, titleBtn: L10n.ok.localized) {
                let signIn = SignInVC.create()
                UserDefaultsManager.shared().country = ""
                UserDefaultsManager.shared().countryId = 0
                UserDefaultsManager.shared().guest = false
                self.present(signIn, animated: true, completion: nil)
            } completion1: {
                self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            getServiceOrder()
        }
    }
    
    func getServiceOrder(){
        self.view.showLoader()
        APIManager.getServiceOrders(user_id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                
                if result.status {
                    self.orderInfo = result.data ?? []
                    self.serviceOrderView.serviceOrderTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.orderInfo = result.data ?? []
                    self.serviceOrderView.serviceOrderTableView.reloadData()
                    self.show_Alert(L10n.sorry.localized, L10n.noServiceSOrdersFound.localized)
                    self.view.hideLoader()
                }
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = serviceOrderView.serviceOrderTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServiceOrderTableViewCell
        cell.serviceImage.setCornerRadius(radius: 8)
        let img = orderInfo[indexPath.row].repairCategory.image
        let image = img.replace(string: " ", replacement: "%20") ?? ""
        imageLoader.obtainImageWithPath(imagePath: image) { (image) in
            cell.serviceImage.image = image

        }
        if L10n.lang.localized == Language.arabic {
            cell.serviceName.text = orderInfo[indexPath.row].repairCategory.name.ar
            cell.subServiceName.text = orderInfo[indexPath.row].repairCategory.name.ar
        }
        else {
            cell.serviceName.text = orderInfo[indexPath.row].repairCategory.name.en
            cell.subServiceName.text = orderInfo[indexPath.row].repairCategory.name.en
        }
        
        cell.servicePrice.text = "\(orderInfo[indexPath.row].repairCategory.price ?? 0) \(getCountryCurrency())"
        return cell
    }
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


}
