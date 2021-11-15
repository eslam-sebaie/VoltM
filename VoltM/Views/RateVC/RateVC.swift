//
//  RateVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit
import SDWebImage
class RateVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var rateView: RateView!
    var imageLoader = ImageLoader()
    var receiveProducts = ProductInfo(id: 0, name: ProductLocalize(en: "", ar: ""), image: "", price: 0, newPrice: 0, desc: ProductLocalize(en: "", ar: ""), offer: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        rateView.updateUI()
        imageLoader.obtainImageWithPath(imagePath: receiveProducts.image ?? "") { (image) in
            self.rateView.popProductImage.image = image
        }
        rateView.popProductPrice.text = "\(receiveProducts.price ?? 0) \(getCountryCurrency())"
        if L10n.lang.localized == Language.arabic {
            rateView.productName.text = receiveProducts.name?.ar
            rateView.popProductName.text = receiveProducts.name?.ar
        }
        else {
            rateView.productName.text = receiveProducts.name?.en
            rateView.popProductName.text = receiveProducts.name?.en
        }

        rateView.rateTableView.rowHeight = UITableView.automaticDimension
        rateView.rateTableView.estimatedRowHeight = 44
        
    }
    class func create() -> RateVC {
        let rateVC: RateVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.rateVC)
        return rateVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reviewPressed(_ sender: Any) {
        rateView.popRateView.isHidden = false
    }
    @IBAction func sendReviewPressed(_ sender: Any) {
        if rateView.popRate.rating == 0.0 {
            show_Alert(L10n.please.localized, L10n.enterRateValue.localized)
        }
        else {
            guard let rateTF = rateView.rateTF.text, rateTF != "" else {
                show_Alert(L10n.please.localized, L10n.enterYourComment.localized)
                return
            }
            self.view.showLoader()
            APIManager.sendReview(rate: rateTF, value: String(rateView.popRate.rating), product_id: receiveProducts.id, user_id: String(UserDefaultsManager.shared().userId ?? 0)) { response in
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
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
            }
        }
        
       
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        rateView.popRateView.isHidden = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.rateView.rateTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! RateTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
