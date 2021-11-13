//
//  StoreVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit
import SDWebImage
class StoreVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var storeView: StoreView!
    var receiveMainCategoryID = 0
    var receiveCountryID = 0
    var storeInfo = [StoreInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storeView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> StoreVC {
        let storeVC: StoreVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeVC)
        return storeVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getStores()
    }
    func getStores() {
        self.view.showLoader()
        APIManager.getStores(mainCat_id: receiveMainCategoryID, country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noStores.localized)
                    self.view.hideLoader()
                }
                else {
                    self.storeInfo = result.data ?? []
                    self.storeView.storeTableView.reloadData()
                    self.view.hideLoader()
                }
                
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        guard let name = storeView.searchTF.text , name != "" else {
            show_Alert(L10n.please.localized, L10n.storeName.localized)
            return
        }
        self.view.showLoader()
        APIManager.searchStores(stroeName: name, country_id: UserDefaultsManager.shared().countryId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noStores.localized)
                    self.storeView.searchTF.text = ""
                    self.storeInfo = []
                    self.storeView.storeTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.storeInfo = result.data ?? []
                    self.storeView.storeTableView.reloadData()
                    self.view.hideLoader()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.storeView.storeTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.storeImage.setCornerRadius(radius: 10)
        cell.storeCardView.dropShadow(radius: 10, shadow: 2)
        cell.storeImage.sd_setImage(with: URL(string: storeInfo[indexPath.row].image ?? ""), completed: nil)
        if L10n.lang.localized == Language.arabic {
            cell.storeName.text = storeInfo[indexPath.row].name?.ar
        }
        else {
            cell.storeName.text = storeInfo[indexPath.row].name?.en
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storeCat = StoreCategoryVC.create()
        storeCat.receiveStoreID = storeInfo[indexPath.row].id
        storeCat.receiveStoreInfo = storeInfo[indexPath.row]
        self.present(storeCat, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
