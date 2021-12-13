//
//  StoreCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var storeCategoryView: StoreCategoryView!
    var receiveStoreID = 0
    var receiveStoreInfo = StoreInfo(id: 0, name: StoreLocalize(en: "", ar: ""), image: "", address: "", countryID: 0, cityID: 0, mainCatID: 0, createdAt: "", updatedAt: "")
    var storeCategories = [StoresCategoryInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCategoryView.updateUI()
        if L10n.lang.localized == Language.arabic {
            storeCategoryView.storeName.text = receiveStoreInfo.name?.ar
        }
        else {
            storeCategoryView.storeName.text = receiveStoreInfo.name?.en
        }
        storeCategoryView.storeLocation.text = receiveStoreInfo.address
        storeCategoryView.storeImage.sd_setImage(with: URL(string: receiveStoreInfo.image ?? ""), completed: nil)
        // Do any additional setup after loading the view.
    }
    
    class func create() -> StoreCategoryVC {
        let storeCategoryVC: StoreCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeCategoryVC)
        return storeCategoryVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getStoreCategory()
    }
    
    func getStoreCategory() {
        self.view.showLoader()
        APIManager.getStoresCategory(store_id: receiveStoreID) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noCategories.localized)
                    self.view.hideLoader()
                }
                else {
                    self.storeCategories = result.data ?? []
                    self.storeCategoryView.storeCategoryTableView.reloadData()
                    self.view.hideLoader()
                }
               
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        guard let name = storeCategoryView.searchTF.text , name != "" else {
            show_Alert(L10n.please.localized, L10n.catName.localized)
            return
        }
        self.view.showLoader()
        APIManager.searchCatStores(categoryName: name, store_id: receiveStoreInfo.id) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noCategories.localized)
                    self.storeCategories = []
                    self.storeCategoryView.searchTF.text = ""
                    self.storeCategoryView.storeCategoryTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.storeCategories = result.data ?? []
                    self.storeCategoryView.storeCategoryTableView.reloadData()
                    self.view.hideLoader()
                }
               
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.storeCategoryView.storeCategoryTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreCategoryTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.catImage.setCornerRadius(radius: 10)
        cell.catCardView.dropShadow(radius: 8, shadow: 2)
        let img = storeCategories[indexPath.row].image ?? ""
        let image = img.replace(string: " ", replacement: "%20")
        cell.catImage.sd_setImage(with: URL(string: image), completed: nil)
        if L10n.lang.localized == Language.arabic {
            cell.catName.text = storeCategories[indexPath.row].name.ar
        }
        else {
            cell.catName.text = storeCategories[indexPath.row].name.en
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storeSubCat = StoreSubCategoryVC.create()
        storeSubCat.receiveCatID = storeCategories[indexPath.row].id
        storeSubCat.receiveCatImage = storeCategories[indexPath.row].image ?? ""
        self.present(storeSubCat, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
