//
//  StoreSubCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit
import SDWebImage
class StoreSubCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var StoreSubCatView: StoreSubCategoryView!
    var receiveCatID = 0
    var receiveCatImage = ""
    var storeSubCategories = [StoresCategoryInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        StoreSubCatView.updateUI()
        let image = receiveCatImage.replace(string: " ", replacement: "%20")
        StoreSubCatView.storeImage.sd_setImage(with: URL(string: image), completed: nil)
        // Do any additional setup after loading the view.
    }
    class func create() -> StoreSubCategoryVC {
        let storeSubCategoryVC: StoreSubCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeSubCategoryVC)
        return storeSubCategoryVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getStoreSubCategory()
    }
    
    func getStoreSubCategory() {
        self.view.showLoader()
        APIManager.getStoresSubCategory(parent_id: receiveCatID) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noSubCat.localized)
                }
                else {
                    self.storeSubCategories = result.data ?? []
                    self.StoreSubCatView.subCatTableView.reloadData()
                    
                }
                self.view.hideLoader()
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        guard let name = StoreSubCatView.searchTF.text , name != "" else {
            show_Alert(L10n.please.localized, L10n.subCatName.localized)
            return
        }
        self.view.showLoader()
        APIManager.searchSubCatStores(subCategoryName: name, parent_id: receiveCatID) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.noSubCat.localized)
                    self.storeSubCategories = []
                    self.StoreSubCatView.searchTF.text = ""
                    self.StoreSubCatView.subCatTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.storeSubCategories = result.data ?? []
                    self.StoreSubCatView.subCatTableView.reloadData()
                    self.view.hideLoader()
                }
               
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeSubCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.StoreSubCatView.subCatTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreSubCategoryTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.subCatImage.setCornerRadius(radius: 10)
        cell.subCatCardView.dropShadow(radius: 8, shadow: 2)
        
        let img = storeSubCategories[indexPath.row].image ?? ""
        let image = img.replace(string: " ", replacement: "%20")
        
        cell.subCatImage.sd_setImage(with: URL(string: image), completed: nil)
        if L10n.lang.localized == Language.arabic {
            cell.subCatName.text = storeSubCategories[indexPath.row].name.ar
        }
        else {
            cell.subCatName.text = storeSubCategories[indexPath.row].name.en
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = ProductVC.create()
        product.receiveSubCatId = storeSubCategories[indexPath.row].id
        self.present(product, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
