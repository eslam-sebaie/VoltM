//
//  SignUpView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 10/23/21.
//

import UIKit

class SignUpVC: UIViewController, sendingAddress {
    func send(address: String) {
        signUpView.addressTF.text = address
    }
    @IBOutlet var signUpView: SignUpView!
    var imagePicker = UIImagePickerController()
    var storeImg = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
    
    @IBAction func uploadImagePressed(_ sender: Any) {
        setImagePicker()
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = sb.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        mapVC.delegate = (self as sendingAddress)
        self.present(mapVC ,animated: true, completion: nil)
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
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        signUpView.userImage.image = image
        //self.signUpView.showLoader()
//        APIManager.uploadPhoto(image: image!) { (err, img) in
//            APIManager.updateImage(emailNumber: UserDefaultsManager.shared().Email ?? "", image: img?.data ?? "") {
//                self.signUpView.hideLoader()
//            }
//        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}
