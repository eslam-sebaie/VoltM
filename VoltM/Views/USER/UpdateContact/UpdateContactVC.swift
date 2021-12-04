//
//  UpdateContactVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/20/21.
//

import UIKit

class UpdateContactVC: UIViewController {

    
    @IBOutlet var updateContactView: UpdateContactView!
    var userInfo = SignUpInfo(fname: "", lname: "" , email: "",phone: "",password: "",address: "", latitude: "",longitude: "", image: "", id: 0)
    var img = ""
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContactView.updateUI()
        self.updateContactView.userName.text = "\(self.userInfo.fname ?? "") \(self.userInfo.lname ?? "")"
        self.updateContactView.userImage.sd_setImage(with: URL(string: self.userInfo.image ?? ""), completed: nil)
        self.updateContactView.phoneTF.text = self.userInfo.phone ?? ""
        self.updateContactView.emailTF.text = self.userInfo.email ?? ""
        self.img = self.userInfo.image ?? ""
        imagePicker.delegate = self
    }
    class func create() -> UpdateContactVC {
        let updateContactVC: UpdateContactVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateContactVC)
        return updateContactVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imagePressed(_ sender: Any) {
        setImagePicker()
    }
    @IBAction func logoutPressed(_ sender: Any) {
        let signIn = WelcomeVC.create()
        UserDefaultsManager.shared().Token = ""
        UserDefaultsManager.shared().Email = ""
        UserDefaultsManager.shared().phone = ""
        UserDefaultsManager.shared().userId = 0
        UserDefaultsManager.shared().Password = ""
        self.present(signIn, animated: true, completion: nil)
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let address = UpdateAddressVC.create()
        address.modalPresentationStyle = .fullScreen
        address.modalTransitionStyle = .coverVertical
        address.userInfo = userInfo
        self.present(address, animated: true, completion: nil)
    }
    
    @IBAction func infoPressed(_ sender: Any) {
        let account = UpdateInfoVC.create()
        account.modalPresentationStyle = .fullScreen
        account.modalTransitionStyle = .coverVertical
        self.present(account, animated: true, completion: nil)
    }
    @IBAction func updatePressed(_ sender: Any) {
        guard let email = updateContactView.emailTF.text , email != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.wrongEmail.localized)
            return
        }
        guard let phone = updateContactView.phoneTF.text , phone != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterPhone.localized)
            return
        }
        if updateContactView.emailTF.text == userInfo.email && updateContactView.phoneTF.text == userInfo.phone && userInfo.image == self.img {
            self.show_Alert(L10n.sorry.localized, L10n.youDidnTUpdateAnyThing.localized)
        }
        else {
            self.view.showLoader()
            APIManager.updateUser(id: UserDefaultsManager.shared().userId ?? 0,fname: self.userInfo.fname!, lname: self.userInfo.lname!, email: email, password: UserDefaultsManager.shared().Password ?? "", phone: phone, address: self.userInfo.address!, latitude: self.userInfo.latitude!, longitude: self.userInfo.longitude!, image: self.img) { (response) in
                switch response {
                case .failure(let err):
                    print(err)
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                case .success(let result):
                    print(result)
                    self.view.hideLoader()
                    
                        let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                        let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                        self.present(tabVC, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    
    @IBAction func phonePressed(_ sender: Any) {
    }
    
}
extension UpdateContactVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        updateContactView.userImage.image = image
        self.view.showLoader()
        APIManager.uploadPhoto(image: image!) { (err, img) in
            self.img = img?.data ?? ""
            self.view.hideLoader()
            
        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}
