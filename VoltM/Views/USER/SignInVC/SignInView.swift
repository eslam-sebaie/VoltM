//
//  SignInView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit

class SignInView: UIView {

    
    @IBOutlet weak var loginHeader: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var dontHaveAccount: UILabel!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTF: HooopTextfield!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: HooopTextfield!
    @IBOutlet weak var loginDesign: UIButton!
    @IBOutlet weak var signUpDesign: UIButton!
    
    @IBOutlet weak var emailImage: UIImageView!
    
    @IBOutlet weak var passImage: UIImageView!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            emailTF.placeholder = "البريد الالكتروني"
            emailTF.textAlignment = .right
            passwordTF.placeholder = "الرقم السري"
            passwordTF.textAlignment = .right
            loginHeader.text = "الدخول بواسطه."
            orLabel.text = "او"
            loginDesign.setTitle("دخول", for: .normal)
            dontHaveAccount.text = "ليس لديك حساب؟"
            signUpDesign.setTitle("تسجيل", for: .normal)
            emailImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            passImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        loginDesign.setCornerRadius(radius: 8)
        emailView.setCornerRadius(radius: 8)
        passwordView.setCornerRadius(radius: 8)
        
    }
    
}
