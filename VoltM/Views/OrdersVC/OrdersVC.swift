//
//  OrdersVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet var ordersView: OrdersView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> OrdersVC {
        let ordersVC: OrdersVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.ordersVC)
        return ordersVC
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = OrderDetailsVC.create()
        self.present(details, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ordersView.orderTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OrdersTableViewCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
