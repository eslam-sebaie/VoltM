//
//  MainCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class MainCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var mainCategoryView: MainCategoryView!
    var idArray = [Int]()
    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainCategoryView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> MainCategoryVC {
        let mainCategoryVC: MainCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.mainCategoryVC)
        return mainCategoryVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getAllMainCategory()
    }
    func getAllMainCategory(){
        self.view.showLoader()
        APIManager.getAllMainCategory { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                
                for i in result.data ?? []{
                    self.nameArray.append(i.name ?? "")
                    self.idArray.append(i.id ?? 0)
                }
                self.view.hideLoader()
                self.mainCategoryView.categoryTableView.reloadData()
                
            }
        }
    }
//    @IBAction func backPressed(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainCategoryView.categoryTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! MainCategoryTableViewCell
         
        cell.mainView.setCornerRadius(radius: 10)
        cell.catImage.setCornerRadius(radius: 10)
        cell.catView.dropShadow(radius: 8, shadow: 2)
        if L10n.lang.localized == Language.arabic {
            if nameArray[indexPath.row] == "Electronic Devices" {
                cell.catName.text = "أجهزه إلكترونيه"
            }
            else {
                cell.catName.text = "أجهزه محمول"
            }
        }
        else {
            cell.catName.text = nameArray[indexPath.row]
        }
        if nameArray[indexPath.row] == "Electronic Devices" {
            cell.catImage.image = Asset.electronicDevices.image
        }
        else {
            cell.catImage.image = Asset.mobiles.image
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let store = StoreVC.create()
        store.receiveMainCategoryID = idArray[indexPath.row]
        self.present(store, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.mainCategoryView.categoryTableView.frame.height / 2
    }
}
