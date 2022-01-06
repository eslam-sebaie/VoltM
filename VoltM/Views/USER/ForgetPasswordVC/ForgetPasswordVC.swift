//
//  ForgetPasswordVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 1/4/22.
//

import UIKit

class ForgetPasswordVC: UIViewController {

    @IBOutlet var forgetView: ForgetPasswordView!
    var email = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        forgetView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> ForgetPasswordVC {
        let forgetPasswordVC: ForgetPasswordVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.forgetPasswordVC)
        return forgetPasswordVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eyePressed(_ sender: UIButton) {
        if sender.isSelected {
            forgetView.newPassTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            forgetView.newPassTF.isSecureTextEntry = false
            sender.isSelected = true
        }
    }
    @IBAction func eyePressed1(_ sender: UIButton) {
        if sender.isSelected {
            forgetView.confirmPassTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            forgetView.confirmPassTF.isSecureTextEntry = false
            sender.isSelected = true
        }
    }
    @IBAction func confirmMailPressed(_ sender: Any) {
        guard let mail = forgetView.emailTF.text, mail != "" else {
            show_Alert(L10n.please.localized, L10n.inCorrectEmail.localized)
            return
        }
        email = mail
        self.view.showLoader()
        APIManager.forgetPassword(email: mail) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized,L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    self.forgetView.mainView.isHidden = true
                    self.forgetView.mainPassView.isHidden = false
                    self.view.hideLoader()
                }
                else {
                    self.show_Alert(L10n.please.localized, L10n.inCorrectEmail.localized)
                    self.view.hideLoader()
                }
            }
        }
    }
    
    @IBAction func confirmPassPressed(_ sender: Any) {
        guard let pass = forgetView.newPassTF.text, pass != "" else {
            show_Alert(L10n.please.localized, L10n.inCorrectPassword.localized)
            return
        }
        guard let newPass = forgetView.confirmPassTF.text, newPass != "" else {
            show_Alert(L10n.please.localized, L10n.inCorrectPassword.localized)
            return
        }
        if pass == newPass {
            self.view.showLoader()
            APIManager.confirmPassword(email: email, password: pass) { response in
                switch response {
                case .failure( _):
                    self.show_Alert(L10n.sorry.localized,L10n.wentWrong.localized)
                    self.view.hideLoader()
                case .success(let result):
                    if result.status {
                        UserDefaultsManager.shared().Password = pass
                        self.view.hideLoader()
                        let sign = SignInVC.create()
                        self.present(sign, animated: true, completion: nil)
                    }
                }
            }
            
        }
        else {
            show_Alert(L10n.sorry.localized, L10n.pleaseEnterCorrectPassword.localized)
            return
        }
        
    }
    
}
