//
//  MainCategoryView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class MainCategoryView: UIView {

    @IBOutlet weak var mainHeader: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            mainHeader.text = "Main Category".localized
        }
    }
}
