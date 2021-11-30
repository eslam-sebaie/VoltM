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
        getCart()
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

    @IBAction func continuePressed(_ sender: Any) {
        self.view.showLoader()
//        for i in cartInfo {
//            self.productsId.append(i.product?.id ?? 0)
//        }
        APIManager.confirmCart(cart_id: cartInfo[0].cartID, user_id: UserDefaultsManager.shared().userId ?? 0) { response in
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
                    // will Go to CheckOut
                    self.view.hideLoader()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cartView.cartTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! CartTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        if L10n.lang.localized == Language.arabic {
            cell.productName.text = cartInfo[indexPath.row].product?.name?.ar
        }
        else {
            cell.productName.text = cartInfo[indexPath.row].product?.name?.en
        }
        cell.productPrice.text = "\(cartInfo[indexPath.row].product?.price ?? 0) \(getCountryCurrency())"
        imageLoader.obtainImageWithPath(imagePath: cartInfo[indexPath.row].product?.image ?? "") { (image) in
            cell.productImage.image = image
        }
        cell.productQty.text = "Quantity: x\(cartInfo[indexPath.row].qty)"
        
        
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
            APIManager.deleteCart(cart_id: cID, product_id: pID) {_ in
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
