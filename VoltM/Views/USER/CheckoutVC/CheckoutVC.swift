//
//  CheckoutVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/3/21.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet var checkoutView: CheckoutView!
    var receiveCartID = 0
    var subTotal = 0.0
    var storeArray = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> CheckoutVC {
        let checkoutVC: CheckoutVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.checkoutVC)
        return checkoutVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getDelivery()
        getTime()
    }
    func getTime(){
        self.view.showLoader()
        APIManager.getTime(country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if UserDefaultsManager.shared().gover == UserDefaultsManager.shared().cityId {
                    self.checkoutView.deliveryTimeLabel.text = "\(result.data?[0].estimationTimeSameCity ?? 0) Days"
                    
                }
                else {
                    self.checkoutView.deliveryTimeLabel.text = "\(result.data?[0].estimationTimeDiffCity ?? 0) Days"
                   
                }
                self.view.hideLoader()
            }
        }
    }
    
    func getDelivery(){
        self.view.showLoader()
        APIManager.getDelivery(country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if UserDefaultsManager.shared().gover == UserDefaultsManager.shared().cityId {
                    if UserDefaultsManager.shared().countryId == 2 {
                        if L10n.lang.localized == Language.arabic {
                            self.checkoutView.deliveryHeader.text = "التوصيل + الضريبه"
                        }
                        else {
                            self.checkoutView.deliveryHeader.text = "Delivery + Tax"
                        }
                        let tax = 0.15 * Double(self.subTotal)
                        let deliver = tax + Double(result.data?[0].sameCityPrice ?? 0)
                        let deli = String(format:"%.1f", deliver)
                        self.checkoutView.deliveryVal.text = "\(deli) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        let total = (Double(self.subTotal) + deliver)
                        self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
                    }
                    else {
                        self.checkoutView.deliveryVal.text = "\(result.data?[0].sameCityPrice ?? 0) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        let total = (self.subTotal + (result.data?[0].sameCityPrice)!)
                        self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
                    }
                }
                else {
                    if UserDefaultsManager.shared().countryId == 2 {
                        if L10n.lang.localized == Language.arabic {
                            self.checkoutView.deliveryHeader.text = "التوصيل + الضريبه"
                        }
                        else {
                            self.checkoutView.deliveryHeader.text = "Delivery + Tax"
                        }
                        let tax = 0.15 * Double(self.subTotal)
                        let deliver = tax + Double(result.data?[0].diffCityPrice ?? 0)
                        let deli = String(format:"%.1f", deliver)
                        self.checkoutView.deliveryVal.text = "\(deli) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        let total = (Double(self.subTotal) + deliver)
                        self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
                    }
                    else {
                        
                        self.checkoutView.deliveryVal.text = "\(result.data?[0].diffCityPrice ?? 0) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        let total = (self.subTotal + (result.data?[0].diffCityPrice)!)
                        self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
                    }
                }
                self.view.hideLoader()
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        self.view.showLoader()
        print("Sebbbb\(storeArray)")
        APIManager.confirmCart(cart_id: receiveCartID, user_id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
                else {
                    self.view.hideLoader()
                    self.showAlert(title: L10n.success.localized, massage: L10n.yourRequestWillBeProcced.localized, present: self, titleBtn: L10n.ok.localized) {
                        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                        self.present(tabVC, animated: true, completion: nil)
                    }
                    
                }
            }
        }
    }
    
}
