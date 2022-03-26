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
    var total = 0.0
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
        if UserDefaultsManager.shared().countryId != 3 {
            checkoutView.paymentStack.isHidden = true
            checkoutView.payCardHeight.constant = 120
        }
        else {
            checkoutView.paymentStack.isHidden = false
            checkoutView.payCardHeight.constant = 170
        }
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
                        self.total = (Double(self.subTotal) + deliver)
                        self.checkoutView.totalPriceVal.text = "\(self.total) \(self.getCountryCurrency())"
                    }
                    else {
                        self.checkoutView.deliveryVal.text = "\(result.data?[0].sameCityPrice ?? 0) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        self.total = (self.subTotal + (result.data?[0].sameCityPrice)!)
                        self.checkoutView.totalPriceVal.text = "\(self.total) \(self.getCountryCurrency())"
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
                        self.total = (Double(self.subTotal) + deliver)
                        self.checkoutView.totalPriceVal.text = "\(self.total) \(self.getCountryCurrency())"
                    }
                    else {
                        
                        self.checkoutView.deliveryVal.text = "\(result.data?[0].diffCityPrice ?? 0) \(self.getCountryCurrency())"
                        self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                        self.total = (self.subTotal + (result.data?[0].diffCityPrice)!)
                        self.checkoutView.totalPriceVal.text = "\(self.total) \(self.getCountryCurrency())"
                    }
                }
                self.view.hideLoader()
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    var cachChoice = false
    var cardChoice = false
    @IBAction func cashPressed(_ sender: UIButton) {
        if sender.isSelected {
            checkoutView.cachDesign.setImage(Asset.uncheck.image, for: .normal)
            checkoutView.cardDesign.setImage(Asset.uncheck.image, for: .normal)
            cachChoice = false
            cardChoice = false
            //checkoutView.cardDesign.isEnabled = true
            sender.isSelected = false
        }
        else {
            checkoutView.cachDesign.setImage(Asset.check.image, for: .normal)
            checkoutView.cardDesign.setImage(Asset.uncheck.image, for: .normal)
            cachChoice = true
            cardChoice = false
           // checkoutView.cardDesign.isEnabled = false
            sender.isSelected = true
        }
    }
    
    @IBAction func cardPressed(_ sender: UIButton) {
        if sender.isSelected {
            checkoutView.cardDesign.setImage(Asset.uncheck.image, for: .normal)
            checkoutView.cachDesign.setImage(Asset.uncheck.image, for: .normal)
            cachChoice = false
            cardChoice = false
            //checkoutView.cachDesign.isEnabled = true
            sender.isSelected = false
        }
        else {
            checkoutView.cardDesign.setImage(Asset.check.image, for: .normal)
            checkoutView.cachDesign.setImage(Asset.uncheck.image, for: .normal)
            cachChoice = false
            cardChoice = true
           // checkoutView.cachDesign.isEnabled = false
            sender.isSelected = true
        }
    }
    
    @IBAction func continuePressed(_ sender: Any) {
        
        if cachChoice {
            self.view.showLoader()
            
            APIManager.confirmCart(cart_id: receiveCartID, user_id: UserDefaultsManager.shared().userId ?? 0, payment_method: "cache", invoice_id: 0) { response in
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
        else if cardChoice {
            let pay = PaymentVC.create()
            pay.receiveCartID = receiveCartID
            pay.receiveTotalPrice = total
            self.present(pay, animated: true, completion: nil)
        }
        else {
            self.show_Alert(L10n.sorry.localized, L10n.youMustChoosePaymentWay.localized)
        }
        
    }
    
}
