//
//  UpdateInfoView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateInfoView: UIView {

    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var logoutDesign: UIButton!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var nameTF: HooopTextfield!
    @IBOutlet weak var passTF: HooopTextfield!
    @IBOutlet weak var eyeDesign: UIButton!
    @IBOutlet weak var updateDesign: UIButton!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            nameTF.placeholder = "الاسم"
            nameTF.textAlignment = .right
            passTF.placeholder = "الرقم السري"
            passTF.textAlignment = .right
        }
        logoutDesign.setCornerRadius(radius: 8)
        userImg.setCornerRadius(radius: 45)
        nameView.setCornerRadius(radius: 8)
        passView.setCornerRadius(radius: 8)
        updateDesign.setCornerRadius(radius: 8)
    }

}
