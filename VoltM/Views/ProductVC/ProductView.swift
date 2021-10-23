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
    @IBOutlet weak var searchTF: HooopTextfield!
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var searchImage: UIImageView!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            productHeader.text = "Products".localized
            backDesign.setImage(Asset.backAr.image, for: .normal)
            searchTF.placeholder = "بحث"
            searchTF.textAlignment = .right
            searchImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        searchView.setCornerRadius(radius: 10)
    }

}
