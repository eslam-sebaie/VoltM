//
//  SignUpView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit

class SignUpView: UIView {

    @IBOutlet weak var signUpHeader: UILabel!
    @IBOutlet weak var fillHeader: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var fNameTF: HooopTextfield!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var lNameTF: HooopTextfield!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTF: HooopTextfield!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: HooopTextfield!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTF: HooopTextfield!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressTF: HooopTextfield!
    @IBOutlet weak var signUpDesign: UIButton!
    @IBOutlet weak var haveAccount: UILabel!
    @IBOutlet weak var loginDesign: UIButton!
    @IBOutlet weak var fNameImage: UIImageView!
    
    @IBOutlet weak var lNameImage: UIImageView!
    
    @IBOutlet weak var emailImage: UIImageView!
    
    @IBOutlet weak var passImage: UIImageView!
    
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var addressImage: UIImageView!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            fNameTF.placeholder = "الأسم الأول"
            fNameTF.textAlignment = .right
            lNameTF.placeholder = "الأسم الثاني"
            lNameTF.textAlignment = .right
            emailTF.placeholder = "البريد الالكتروني"
            emailTF.textAlignment = .right
            passwordTF.placeholder = "الرقم السري"
            passwordTF.textAlignment = .right
            
            phoneTF.placeholder = "رقم التليفون"
            phoneTF.textAlignment = .right
            addressTF.placeholder = "العنوان"
            addressTF.textAlignment = .right
            
            signUpHeader.text = "التسجيل بواسطه."
            fillHeader.text = "او املأ البيانات"
            loginDesign.setTitle("دخول", for: .normal)
            haveAccount.text = "هل لديك حساب؟"
            signUpDesign.setTitle("تسجيل", for: .normal)
            
            fNameImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            lNameImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            emailImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            passImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            phoneImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            addressImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            
        }
        userImage.setCornerRadius(radius: 45)
        firstNameView.setCornerRadius(radius: 8)
        lastNameView.setCornerRadius(radius: 8)
        emailView.setCornerRadius(radius: 8)
        passwordView.setCornerRadius(radius: 8)
        phoneView.setCornerRadius(radius: 8)
        signUpDesign.setCornerRadius(radius: 8)
        addressView.setCornerRadius(radius: 8)
        
    }
    
    
    
    
}
