//
//  OrdersView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrdersView: UIView {

    @IBOutlet weak var orderHeader: UIImageView!
    
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var orderTableView: UITableView!
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            orderHeader.image = UIImage(named: "ordersHeaderAr")
        }
    }
    
}
