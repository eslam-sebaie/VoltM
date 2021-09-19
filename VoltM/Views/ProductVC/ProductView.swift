//
//  ProductView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductView: UIView {

    @IBOutlet weak var productHeader: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var productTableView: UITableView!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            productHeader.text = "Products".localized
            backDesign.setImage(Asset.backAr.image, for: .normal)
        }
        searchView.setCornerRadius(radius: 10)
    }

}
