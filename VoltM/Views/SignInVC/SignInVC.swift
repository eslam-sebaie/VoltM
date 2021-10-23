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
            self.show_Alert("Sorry", "InCorrect Email")
            return
        }
        guard let pass = signInView.passwordTF.text , pass != "" else {
            self.show_Alert("Sorry", "InCorrect Password")
            return
        }
        
        
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let signUp = SignUpVC.create()
        self.present(signUp, animated: true, completion: nil)
    }
    
   
}
