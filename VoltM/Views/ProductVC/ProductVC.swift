//
//  ProductVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var productView: ProductView!
    var receiveSubCatId = 0
    var storeProducts = [ProductInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        productView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> ProductVC {
        let productVC: ProductVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.productVC)
        return productVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        getStoreProducts()
    }
    func getStoreProducts() {
        self.view.showLoader()
        APIManager.getProducts(subCategory_id: receiveSubCatId) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noSubCat.localized)
                }
                else {
                    self.storeProducts = result.data ?? []
                    self.productView.productTableView.reloadData()
                    
                }
                self.view.hideLoader()
            }
        }
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        guard let name = productView.searchTF.text , name != "" else {
            show_Alert(L10n.please.localized, L10n.productName.localized)
            return
        }
        self.view.showLoader()
        APIManager.searchProducts(productName: name, subCategory_id: receiveSubCatId) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noproductName.localized)
                    self.storeProducts = []
                    self.productView.searchTF.text = ""
                    self.productView.productTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.storeProducts = result.data ?? []
                    self.productView.productTableView.reloadData()
                    self.view.hideLoader()
                }
               
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productView.productTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! ProductTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        cell.productImage.sd_setImage(with: URL(string: storeProducts[indexPath.row].image ?? ""), completed: nil)
        cell.productPrice.text = "\(storeProducts[indexPath.row].price ?? 0)"
        if L10n.lang.localized == Language.arabic {
            cell.productName.text = storeProducts[indexPath.row].name?.ar
            cell.productDesc.text = storeProducts[indexPath.row].desc?.ar
        }
        else {
            cell.productName.text = storeProducts[indexPath.row].name?.en
            cell.productDesc.text = storeProducts[indexPath.row].desc?.en
        }
        
        cell.ratePressedCompletion = { [weak self] in
            let rate = RateVC.create()
            self?.present(rate, animated: true, completion: nil)
        }
        cell.favPressedCompletion = { [weak self] in
            print("In Fav")
//            let rate = RateVC.create()
//            self?.present(rate, animated: true, completion: nil)
        }
        cell.cartPressedCompletion = { [weak self] in
            print("In Cart")
//            let rate = RateVC.create()
//            self?.present(rate, animated: true, completion: nil)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = ProductDetailsVC.create()
        details.modalPresentationStyle = .overCurrentContext
        self.present(details, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
