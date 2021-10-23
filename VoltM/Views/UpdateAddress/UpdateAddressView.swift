//
//  UpdateAddressView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateAddressView: UIView {

    
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var logOutDesign: UIButton!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var addressTF: HooopTextfield!
    
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var updateDesign: UIButton!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            addressTF.placeholder = "العنوان"
            addressTF.textAlignment = .right
        }
        logOutDesign.setCornerRadius(radius: 8)
        userImage.setCornerRadius(radius: 45)
        addressView.setCornerRadius(radius: 8)
        updateDesign.setCornerRadius(radius: 8)
        addressImage.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
}
