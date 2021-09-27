//
//  StoreView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreView: UIView {

    @IBOutlet weak var storeHeader: UILabel!
    @IBOutlet weak var storeTableView: UITableView!
    
    @IBOutlet weak var searchTF: HooopTextfield!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var backDesign: UIButton!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            storeHeader.text = L10n.store.localized
            backDesign.setImage(Asset.backAr.image, for: .normal)
            searchTF.placeholder = "بحث"
            searchTF.textAlignment = .right
        }
        searchView.setCornerRadius(radius: 10)
        searchTF.placeholderColor = .white
    }
}
