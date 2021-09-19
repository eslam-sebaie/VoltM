//
//  CartVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet var cartView: CartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> CartVC {
        let cartVC: CartVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.cartVC)
        return cartVC
    }

    @IBAction func continuePressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.cartView.cartTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! CartTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
