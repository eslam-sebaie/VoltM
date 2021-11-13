//
//  LanguageView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class LanguageView: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var headerDesc: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var englishView: UIView!
    @IBOutlet weak var arabicView: UIView!
    @IBOutlet weak var englishDesign: UIButton!
    @IBOutlet weak var arabicDesign: UIButton!
    
    
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            header.text = "Language".localized
            headerDesc.text = "اختار اللغه."
        }
        englishView.setCornerRadius(radius: 32)
        arabicView.setCornerRadius(radius: 32)
    }
}
