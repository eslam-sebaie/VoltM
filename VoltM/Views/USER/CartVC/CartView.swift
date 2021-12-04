//
//  CartView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CartView: UIView {

    
    @IBOutlet weak var cartHeader: UILabel!
    @IBOutlet weak var continueDesign: UIButton!
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var subtotalHeader: UILabel!
    
    @IBOutlet weak var deliveryHeader: UILabel!
    
    @IBOutlet weak var totalPriceHeader: UILabel!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            cartHeader.text = "Cart".localized
            continueDesign.setTitle("Continue".localized, for: .normal)
            subtotalHeader.text = "SubTotal :".localized
            deliveryHeader.text = "Delivery :".localized
            totalPriceHeader.text = "Total Price :".localized
        }
        continueDesign.setCornerRadius(radius: 8)
    }
}
