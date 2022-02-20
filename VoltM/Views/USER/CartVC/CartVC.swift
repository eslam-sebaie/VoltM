//
//  CartVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet var cartView: CartView!
    var cartInfo = [getCartInfo]()
    var imageLoader = ImageLoader()
    var productsId = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        cartView.updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    class func create() -> CartVC {
        let cartVC: CartVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.cartVC)
        return cartVC
    }
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaultsManager.shared().guest! {
            cartView.continueDesign.isHidden = true
            showAlert1(title: L10n.youAraGuest.localized, massage: L10n.doYouWantToRegister.localized, present: self, titleBtn: L10n.ok.localized) {
                let signIn = SignInVC.create()
                UserDefaultsManager.shared().country = ""
                UserDefaultsManager.shared().countryId = 0
                UserDefaultsManager.shared().guest = false
                self.present(signIn, animated: true, completion: nil)
            } completion1: {
                //self.dismiss(animated: true, completion: nil)
            }
        }
        else {
            getCart()
        }
    }
    func getCart() {
        self.view.showLoader()
        APIManager.getCart(user_id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == true {
                    self.cartView.continueDesign.isHidden = false
                    self.cartInfo = result.data ?? []
                }
                else {
                    self.cartInfo = []
                    if L10n.lang.localized == Language.arabic {
                        self.show_Alert(L10n.sorry.localized, "لا يوجد منتجات في السله")
                        self.cartView.continueDesign.isHidden = true
                    }
                    else {
                        self.show_Alert(L10n.sorry.localized, "No Items in Cart.")
                        self.cartView.continueDesign.isHidden = true
                    }
                }
                self.cartView.cartTableView.reloadData()
                self.view.hideLoader()
            }
        }
    }
    var subPrice = 0.0
    var storeArray = [Int]()
    @IBAction func continuePressed(_ sender: Any) {
        subPrice = 0.0
        for i in cartInfo {
            storeArray.append(i.product?.store_id ?? 0)
        }
        print("Sebaie")
        print(cartInfo.count)
        
        for i in cartInfo {
            let doubleQTY = Double(i.qty)
            print(doubleQTY)
            subPrice += ( doubleQTY * (i.product?.price ?? 0.0))
        }
        print(subPrice)
        let deliveryInfo = DeliveryInfoVC.create()
        deliveryInfo.receiveCartID = cartInfo[0].cartID
        deliveryInfo.subTotal = subPrice
        deliveryInfo.storeArray = storeArray
        self.present(deliveryInfo, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cartView.cartTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! CartTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        let img = cartInfo[indexPath.row].product?.image ?? ""
                let image = img.replace(string: " ", replacement: "%20")
        if L10n.lang.localized == Language.arabic {
            cell.productName.text = cartInfo[indexPath.row].product?.name?.ar
            cell.productQty.text = "الكميه: x\(cartInfo[indexPath.row].qty)"
        }
        else {
            cell.productName.text = cartInfo[indexPath.row].product?.name?.en
            cell.productQty.text = "Quantity: x\(cartInfo[indexPath.row].qty)"
        }
        cell.productPrice.text = "\(cartInfo[indexPath.row].product?.price ?? 0) \(getCountryCurrency())"
        imageLoader.obtainImageWithPath(imagePath: image) { (image) in
            cell.productImage.image = image
        }
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.view.showLoader()
            let cID = cartInfo[indexPath.row].cartID
            let pID = cartInfo[indexPath.row].productID
            let id = cartInfo[indexPath.row].id
            APIManager.deleteCart(cart_id: cID, product_id: pID, id: id) {_ in
                self.cartView.hideLoader()
                self.cartInfo.remove(at: indexPath.row)
                if self.cartInfo.count == 0 {
                    self.cartView.continueDesign.isHidden = true
                }
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
   
}
