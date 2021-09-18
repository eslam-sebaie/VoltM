//
//  StoreSubCategoryView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreSubCategoryView: UIView {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var backDesign: UIButton!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var subCatTableView: UITableView!
    
    func updateUI(){
        searchTF.setCornerRadius(radius: 8)
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
        }
    }
    
}
