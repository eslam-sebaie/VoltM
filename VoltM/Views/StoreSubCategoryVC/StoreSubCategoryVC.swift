//
//  StoreSubCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreSubCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var StoreSubCatView: StoreSubCategoryView!
    override func viewDidLoad() {
        super.viewDidLoad()
        StoreSubCatView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> StoreSubCategoryVC {
        let storeSubCategoryVC: StoreSubCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeSubCategoryVC)
        return storeSubCategoryVC
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
        let cell = self.StoreSubCatView.subCatTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreSubCategoryTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.subCatImage.setCornerRadius(radius: 10)
        cell.subCatCardView.dropShadow(radius: 8, shadow: 2)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = ProductVC.create()
        self.present(product, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
