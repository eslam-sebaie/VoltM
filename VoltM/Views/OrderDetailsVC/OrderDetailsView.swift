//
//  OrderDetailsView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrderDetailsView: UIView {

    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var orderDetailsHeader: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var orderDetailsTableView: UITableView!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var payementLabel: UILabel!
    
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            orderDetailsHeader.text = "تفاصيل الطلب"
        }
        addressView.setCornerRadius(radius: 25)
    }
    
    
    
}
