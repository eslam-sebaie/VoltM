//
//  ForgetPasswordView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 1/4/22.
//

import UIKit

class ForgetPasswordView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var emailTF: HooopTextfield!
    @IBOutlet weak var confirmMailDesign: UIButton!
    @IBOutlet weak var mainPassView: UIView!
    @IBOutlet weak var newPassView: UIView!
    @IBOutlet weak var newPassIcon: UIImageView!
    @IBOutlet weak var newPassTF: HooopTextfield!
    @IBOutlet weak var confirmPassDesign: UIButton!
    @IBOutlet weak var confirmPassView: UIView!
    @IBOutlet weak var confirmPassIcon: UIImageView!
    @IBOutlet weak var confirmPassTF: HooopTextfield!
    @IBOutlet weak var BackDesign: UIButton!
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            BackDesign.setImage(Asset.backAr.image, for: .normal)
            emailTF.placeholder = "البريد الالكتروني"
            emailTF.textAlignment = .right
            newPassTF.placeholder = "الرقم السري"
            newPassTF.textAlignment = .right
            confirmPassTF.placeholder = "تاكيد الرقم السري"
            confirmPassTF.textAlignment = .right
            confirmMailDesign.setTitle("تاكيد", for: .normal)
            confirmPassDesign.setTitle("تاكيد", for: .normal)
            emailIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
            newPassIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
            confirmPassIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        mainPassView.isHidden = true
        mainView.setCornerRadius(radius: 8)
        emailView.setCornerRadius(radius: 8)
        confirmMailDesign.setCornerRadius(radius: 8)
        mainPassView.setCornerRadius(radius: 8)
        newPassView.setCornerRadius(radius: 8)
        confirmPassDesign.setCornerRadius(radius: 8)
        confirmPassView.setCornerRadius(radius: 8)
    }
    
    
    
}
