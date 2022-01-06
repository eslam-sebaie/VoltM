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
    @IBOutlet weak var fNameTF: HooopTextfield!
    @IBOutlet weak var lNameTF: HooopTextfield!
    @IBOutlet weak var passTF: HooopTextfield!
    @IBOutlet weak var eyeDesign: UIButton!
    @IBOutlet weak var updateDesign: UIButton!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var fNameImg: UIImageView!
    @IBOutlet weak var lastImg: UIImageView!
    @IBOutlet weak var passImage: UIImageView!
    
    @IBOutlet weak var newPassIcon: UIImageView!
    
    @IBOutlet weak var newPassTF: HooopTextfield!
    
    @IBOutlet weak var newPassView: UIView!
    
    @IBOutlet weak var newPassHeight: NSLayoutConstraint!
    
    
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            fNameTF.placeholder = "الأسم الأول"
            fNameTF.textAlignment = .right
            lNameTF.placeholder = "الأسم الثاني"
            lNameTF.textAlignment = .right
            passTF.placeholder = "الرقم السري"
            passTF.textAlignment = .right
            newPassTF.placeholder = "ادخل الرقم السري الجديد"
            newPassTF.textAlignment = .right
            fNameImg.transform = CGAffineTransform(scaleX: -1, y: 1)
            lastImg.transform = CGAffineTransform(scaleX: -1, y: 1)
            passImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            newPassIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        logoutDesign.setCornerRadius(radius: 8)
        userImg.setCornerRadius(radius: 45)
        nameView.setCornerRadius(radius: 8)
        lastNameView.setCornerRadius(radius: 8)
        passView.setCornerRadius(radius: 8)
        updateDesign.setCornerRadius(radius: 8)
        newPassView.setCornerRadius(radius: 8)
        newPassView.isHidden = true
        newPassHeight.constant = 0
        passTF.isEnabled = false
    }

}
