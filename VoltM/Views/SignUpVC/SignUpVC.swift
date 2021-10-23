//
//  SignUpView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var signUpView: SignUpView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> SignUpVC {
        let signUpVC: SignUpVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.signUpVC)
        return signUpVC
    }
    
    @IBAction func eyePressed(_ sender: UIButton) {
        if sender.isSelected {
            signUpView.passwordTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            signUpView.passwordTF.isSecureTextEntry = false
            sender.isSelected = true
        }
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        
    }
    @IBAction func signUpPressed(_ sender: Any) {
        guard let fname = signUpView.fNameTF.text , fname != "" else {
            self.show_Alert("Sorry", "InCorrect FirstName")
            return
        }
        guard let lname = signUpView.lNameTF.text , lname != "" else {
            self.show_Alert("Sorry", "InCorrect LastName")
            return
        }
        guard let email = signUpView.emailTF.text , email != "" else {
            self.show_Alert("Sorry", "InCorrect Email")
            return
        }
        guard let pass = signUpView.passwordTF.text , pass != "" else {
            self.show_Alert("Sorry", "InCorrect Password")
            return
        }
        guard let phone = signUpView.phoneTF.text , phone != "" else {
            self.show_Alert("Sorry", "InCorrect Phone")
            return
        }
        guard let address = signUpView.addressTF.text , address != "" else {
            self.show_Alert("Sorry", "InCorrect Address")
            return
        }
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let signIn = SignInVC.create()
        self.present(signIn, animated: true, completion: nil)
    }
    

}
