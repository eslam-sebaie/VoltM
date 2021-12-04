//
//  OrderDetailsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrderDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var orderDetailsView: OrderDetailsView!
    var productDetails = [ProductDetail]()
    var cartDetails = [CartDetail]()
    var userInfo = SignUpInfo(fname: "", lname: "" , email: "",phone: "",password: "",address: "", latitude: "",longitude: "", image: "", id: 0)
    var imageLoader = ImageLoader()
    var receiveTotalPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailsView.updateUI()
        orderDetailsView.orderDetailsTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getUser()
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
                    self.orderDetailsView.deliveryLabel.text = "\(result.data?[0].sameCityPrice ?? 0) \(self.getCountryCurrency())"
                    self.orderDetailsView.subTotalLabel.text = "\(self.receiveTotalPrice) \(self.getCountryCurrency())"
                    let total = (self.receiveTotalPrice + (result.data?[0].sameCityPrice)!)
                    self.orderDetailsView.totalPriceLabel.text = "\(total) \(self.getCountryCurrency())"
                }
                else {
                    self.orderDetailsView.deliveryLabel.text = "\(result.data?[0].diffCityPrice ?? 0) \(self.getCountryCurrency())"
                    self.orderDetailsView.subTotalLabel.text = "\(self.receiveTotalPrice) \(self.getCountryCurrency())"
                    let total = (self.receiveTotalPrice + (result.data?[0].diffCityPrice)!)
                    self.orderDetailsView.totalPriceLabel.text = "\(total) \(self.getCountryCurrency())"
                }
                self.view.hideLoader()
            }
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
                    self.orderDetailsView.addressLabel.text = self.userInfo.address
                    self.view.hideLoader()
                }
            }
        }
    }
    
    class func create() -> OrderDetailsVC {
        let orderDetailsVC: OrderDetailsVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.orderDetailsVC)
        return orderDetailsVC
    }
   
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDetails[section].cart?.cartDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderDetailsView.orderDetailsTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OrderDetailsTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        imageLoader.obtainImageWithPath(imagePath: productDetails[indexPath.section].cart?.cartDetails?[indexPath.row].product?.image ?? "") { (image) in
            cell.productImage.image = image
        }
        cell.productQuantity.text = "Quantity: \(productDetails[indexPath.section].cart?.cartDetails?[indexPath.row].qty ?? 0)"
        cell.productPrice.text = "\(productDetails[indexPath.section].cart?.cartDetails?[indexPath.row].product?.price ?? 0) \(getCountryCurrency())"
        
        if L10n.lang.localized == Language.arabic {
            cell.productName.text = productDetails[indexPath.section].cart?.cartDetails?[indexPath.row].product?.name?.ar
        }
        else {
            cell.productName.text = productDetails[indexPath.section].cart?.cartDetails?[indexPath.row].product?.name?.en
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
}
