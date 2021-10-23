//
//  OrderDetailsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrderDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var orderDetailsView: OrderDetailsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        orderDetailsView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> OrderDetailsVC {
        let orderDetailsVC: OrderDetailsVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.orderDetailsVC)
        return orderDetailsVC
    }
   
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderDetailsView.orderDetailsTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OrderDetailsTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
}
