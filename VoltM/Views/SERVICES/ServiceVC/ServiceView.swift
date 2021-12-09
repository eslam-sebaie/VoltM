//
//  ServiceView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/7/21.
//

import UIKit

class ServiceView: UIView {

    @IBOutlet weak var serviceHeader: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var searchTF: HooopTextfield!
    
    @IBOutlet weak var serviceTableView: UITableView!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            serviceHeader.text = "الخدمات"
            searchTF.placeholder = "بحث"
            searchTF.textAlignment = .right
            searchIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        searchView.setCornerRadius(radius: 10)
        searchTF.placeholderColor = .white
        
    }
}
