//
//  OrdersVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet var ordersView: OrdersView!
    var orderInfo = [OrderInfo]()
    var imageLoader = ImageLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> OrdersVC {
        let ordersVC: OrdersVC = UIViewController.create(storyboardName: Storyboards.Orders, identifier: ViewControllers.ordersVC)
        return ordersVC
    }
    override func viewWillAppear(_ animated: Bool) {
        getOrders()
    }
    
    func getOrders() {
        self.view.showLoader()
        APIManager.getOrders(user_id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    self.orderInfo = result.data ?? []
                    self.ordersView.orderTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.show_Alert(L10n.sorry.localized, L10n.noOrdersFound.localized)
                    self.view.hideLoader()
                }
                
               
            }
        }
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ordersView.orderTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OrdersTableViewCell
        cell.orderNumber.text = "Order # : \(orderInfo[indexPath.row].orderNumber)"
        if orderInfo[indexPath.row].status == false {
            if L10n.lang.localized == Language.arabic {
                cell.orderStatus.text = "تحت الطلب"
            }
            else {
                cell.orderStatus.text = "Requested"
            }
            
            cell.orderStatus.textColor = .red
        }
        else {
            if L10n.lang.localized == Language.arabic {
                cell.orderStatus.text = "تم التسليم"
            }
            else {
                cell.orderStatus.text = "Completed"
            }
            
            cell.orderStatus.textColor = .green
        }
        let day = (self.orderInfo[indexPath.row].createdAt)
        
        let date = (day.prefix(10))
        cell.orderDate.text = String(date)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = OrderDetailsVC.create()
        details.productDetails = orderInfo[indexPath.row].details ?? []
        details.receiveTotalPrice = orderInfo[indexPath.row].totalPrice
        self.present(details, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
