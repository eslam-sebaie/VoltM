//
//  FavoriteVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit
import SDWebImage
class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var favoriteView: FavoriteView!
    var favInfo = [getFavInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.updateUI()
        print("Sebaie")
        // Do any additional setup after loading the view.
    }
    class func create() -> FavoriteVC {
        let favoriteVC: FavoriteVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.favoriteVC)
        return favoriteVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getFavorite()
    }
    func getFavorite() {
        
        self.view.showLoader()
        APIManager.getFav(user_id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    self.favInfo = result.data ?? []
                    self.favoriteView.favoriteTableView.reloadData()
                }
                else {
                    self.show_Alert(L10n.sorry.localized, L10n.noFavoritesFound.localized)
                    self.favInfo = []
                    self.favoriteView.favoriteTableView.reloadData()
                }
                self.view.hideLoader()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.favoriteView.favoriteTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! FavoriteTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.productImage.setCornerRadius(radius: 10)
        cell.productCardView.dropShadow(radius: 8, shadow: 2)
        cell.productImage.sd_setImage(with: URL(string: self.favInfo[indexPath.row].product?.image ?? ""), completed: nil)
        if L10n.lang.localized == Language.arabic {
            cell.productName.text = favInfo[indexPath.row].product?.name?.ar
        }
        else {
            cell.productName.text = favInfo[indexPath.row].product?.name?.en
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = ProductDetailsVC.create()
        details.receiveProducts = (self.favInfo[indexPath.row].product!)
        details.modalPresentationStyle = .overCurrentContext
        self.present(details, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.view.showLoader()
            let pID = favInfo[indexPath.row].productID
            APIManager.deleteFav(user_id: UserDefaultsManager.shared().userId ?? 0, product_id: pID ?? 0) {_ in
                self.view.hideLoader()
                self.favInfo.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
