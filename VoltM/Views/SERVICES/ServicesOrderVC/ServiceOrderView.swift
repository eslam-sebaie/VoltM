//
//  ServiceOrderView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/14/21.
//

import UIKit

class ServiceOrderView: UIView {
    
    @IBOutlet weak var orderHeader: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var serviceOrderTableView: UITableView!
    
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            orderHeader.text = "طلبات الخدمه"
            backDesign.setImage(Asset.backAr.image, for: .normal)
        }
    }
}
