//
//  OfferView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class OfferView: UIView {

    @IBOutlet weak var offerHeader: UIImageView!
    @IBOutlet weak var offerTableView: UITableView!
    @IBOutlet weak var backDesign: UIButton!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            offerHeader.image = Asset.offerHeaderAr.image
            backDesign.setImage(Asset.backAr.image, for: .normal)
        }
    }
}
