//
//  UpdateContactView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/20/21.
//

import UIKit

class UpdateContactView: UIView {

    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var logoutDesign: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var updateDesign: UIButton!
    
    @IBOutlet weak var phoneTF: HooopTextfield!
    
    @IBOutlet weak var emailTF: HooopTextfield!
    
    @IBOutlet weak var phoneImage: UIImageView!
    
    @IBOutlet weak var emailImage: UIImageView!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            emailImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            phoneImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        logoutDesign.setCornerRadius(radius: 8)
        userImage.setCornerRadius(radius: 45)
        phoneView.setCornerRadius(radius: 8)
        emailView.setCornerRadius(radius: 8)
        updateDesign.setCornerRadius(radius: 8)
        
    }
}
