//
//  DeliveryInfoVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/3/21.
//

import UIKit

class DeliveryInfoVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet var deliveryInfoView: DeliveryInfoView!
    var pickerView = UIPickerView()
    var cityInfo = [CountryInfo]()
    var goverID = 0
    var receiveCartID = 0
    var subTotal = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        deliveryInfoView.updateUI()
        self.deliveryInfoView.goverTF.inputView = pickerView
        // Do any additional setup after loading the view.
    }
    
    class func create() -> DeliveryInfoVC {
        let deliveryInfoVC: DeliveryInfoVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.deliveryInfoVC)
        return deliveryInfoVC
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
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func countryPressed(_ sender: Any) {
        
        guard let gover = self.deliveryInfoView.goverTF.text, gover != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.chooseYourGovernorate.localized)
            return
        }
        UserDefaultsManager.shared().gover = self.goverID
        let checkout = CheckoutVC.create()
        checkout.receiveCartID = receiveCartID
        checkout.subTotal = subTotal
        self.present(checkout, animated: true, completion: nil)
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
        self.deliveryInfoView.goverTF.text = cityInfo[row].name
        self.goverID = cityInfo[row].id ?? 0
    }
    
}
