//
//  StoreCategoryView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreCategoryView: UIView {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    
    @IBOutlet weak var searchTF: HooopTextfield!
    
    
    @IBOutlet weak var storeCategoryTableView: UITableView!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var searchView: UIView!
    
    func updateUI(){
        searchTF.setCornerRadius(radius: 8)
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            searchTF.placeholder = "بحث"
            searchTF.textAlignment = .right
        }
        searchView.setCornerRadius(radius: 10)
    }
    
}
