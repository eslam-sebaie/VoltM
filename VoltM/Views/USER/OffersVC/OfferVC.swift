//
//  OfferVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit
import SDWebImage
class OfferVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet var offerView: OfferView!
    var offerInfo = [OfferInfo]()
    var productInfo = [ProductInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        offerView.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if UserDefaultsManager.shared().guest! {
//            print("Is Guest")
//        }
//        else {
            getOffers()
            getOffers1()
//        }
    }
    
    func getOffers(){
        self.view.showLoader()
        APIManager.getOffer(country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    self.offerInfo = result.data ?? []
                    self.offerView.offerTableView.reloadData()
                }
                else {
                    self.show_Alert(L10n.sorry.localized, L10n.noOfferFound.localized)
                    self.view.hideLoader()
                }
                self.view.hideLoader()
            }
        }
    }
    func getOffers1(){
        self.view.showLoader()
        APIManager.getOffer1(country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                self.productInfo = result.data ?? []
                self.view.hideLoader()
            }
        }
    }

    class func create() -> OfferVC {
        let offerVC: OfferVC = UIViewController.create(storyboardName: Storyboards.offer, identifier: ViewControllers.offerVC)
        return offerVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.offerView.offerTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OfferTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.offerImage.setCornerRadius(radius: 10)
        cell.storeView.dropShadow(radius: 10, shadow: 3)
        cell.offerImage.sd_setImage(with: URL(string: offerInfo[indexPath.row].image), completed: nil)
        if L10n.lang.localized == Language.arabic {
            cell.storeName.text = offerInfo[indexPath.row].store?.name?.ar
        }
        else {
            cell.storeName.text = offerInfo[indexPath.row].store?.name?.en
        }
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = ProductDetailsVC.create()
        details.receiveProducts = (self.productInfo[indexPath.row])
        UserDefaultsManager.shared().storeId = offerInfo[indexPath.row].storeID
        details.modalPresentationStyle = .overCurrentContext
        self.present(details, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
}
