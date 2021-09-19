//
//  StoreCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var storeCategoryView: StoreCategoryView!
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCategoryView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> StoreCategoryVC {
        let storeCategoryVC: StoreCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeCategoryVC)
        return storeCategoryVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.storeCategoryView.storeCategoryTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreCategoryTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.catImage.setCornerRadius(radius: 10)
        cell.catCardView.dropShadow(radius: 8, shadow: 2)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storeSubCat = StoreSubCategoryVC.create()
        self.present(storeSubCat, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
