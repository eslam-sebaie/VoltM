//
//  SignInVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet var signInView: SignInView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> SignInVC {
        let signInVC: SignInVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.signInVC)
        return signInVC
    }
    
    
    @IBAction func eyePressed(_ sender: UIButton) {
        if sender.isSelected {
            signInView.passwordTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            signInView.passwordTF.isSecureTextEntry = false
            sender.isSelected = true
        }
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        guard let email = signInView.emailTF.text , email != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.inCorrectEmail.localized)
            return
        }
        guard let pass = signInView.passwordTF.text , pass != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.inCorrectPassword.localized)
            return
        }
        
        let response = Validation.shared.validate(values: (type: Validation.ValidationType.email, email))
        
        switch response {
        case .failure(_, let message):
            self.show_Alert(L10n.sorry.localized, message.localized())
        case .success:
            self.view.showLoader()
            APIManager.userLogin(email: email, password: pass) { (response) in
                switch response {
                case .failure(let err):
                    print(err)
                    self.show_Alert(L10n.sorry.localized, L10n.emailOrPasswordIsWrong.localized)
                    self.view.hideLoader()
                case .success(let result):
                    UserDefaultsManager.shared().Token = result.token
                    UserDefaultsManager.shared().Email = result.data?.email
                    UserDefaultsManager.shared().phone = result.data?.phone
                    UserDefaultsManager.shared().userId = result.data?.id
                    UserDefaultsManager.shared().address = result.data?.address
                    UserDefaultsManager.shared().Password = pass
                    self.view.hideLoader()
                    let country = ChooseCountryVC.create()
                    self.present(country, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let signUp = SignUpVC.create()
        self.present(signUp, animated: true, completion: nil)
    }
    
    @IBAction func forgetPressed(_ sender: Any) {
        let forget = ForgetPasswordVC.create()
        self.present(forget, animated: true, completion: nil)
    }
    
    
    @IBAction func guestPressed(_ sender: Any) {
        let country = ChooseCountryVC.create()
        country.guest = true
        self.present(country, animated: true, completion: nil)
    }
    
}
