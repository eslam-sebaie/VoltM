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
    var subTotal = 0
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
                    self.checkoutView.deliveryVal.text = "\(result.data?[0].sameCityPrice ?? 0) \(self.getCountryCurrency())"
                    self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                    let total = (self.subTotal + (result.data?[0].sameCityPrice)!)
                    self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
                }
                else {
                    self.checkoutView.deliveryVal.text = "\(result.data?[0].diffCityPrice ?? 0) \(self.getCountryCurrency())"
                    self.checkoutView.subtotalVal.text = "\(self.subTotal) \(self.getCountryCurrency())"
                    let total = (self.subTotal + (result.data?[0].diffCityPrice)!)
                    self.checkoutView.totalPriceVal.text = "\(total) \(self.getCountryCurrency())"
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
                    let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                    let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                    self.present(tabVC, animated: true, completion: nil)
                }
            }
        }
    }
    
}
