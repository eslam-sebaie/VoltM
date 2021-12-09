//
//  UpdateInfoVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateInfoVC: UIViewController {
    
    @IBOutlet var updateInfoView: UpdateInfoView!
    
    var userInfo = SignUpInfo(fname: "", lname: "" , email: "",phone: "",password: "",address: "", latitude: "",longitude: "", image: "", id: 0)
    var changePass = false
    var img = ""
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfoView.updateUI()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getUser()
    }
    
    func getUser(){
        
        self.view.showLoader()
        APIManager.getUserData(id: UserDefaultsManager.shared().userId ?? 0) { response in
            switch response {
            case.failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status == false {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
                else {
                    self.userInfo = result.data!
                    self.updateInfoView.userName.text = "\(self.userInfo.fname ?? "") \(self.userInfo.lname ?? "")"
                    self.updateInfoView.fNameTF.text = self.userInfo.fname
                    self.updateInfoView.lNameTF.text = self.userInfo.lname
                    self.updateInfoView.passTF.text = UserDefaultsManager.shared().Password
                    self.img = self.userInfo.image ?? ""
                    self.updateInfoView.userImg.sd_setImage(with: URL(string: self.userInfo.image ?? ""), completed: nil)
                    
                    self.view.hideLoader()
                }
            }
        }
    }
    
    class func create() -> UpdateInfoVC {
        let updateInfoVC: UpdateInfoVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateInfoVC)
        return updateInfoVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eyePressed(_ sender: UIButton) {
        if sender.isSelected {
            updateInfoView.passTF.isSecureTextEntry = true
            sender.isSelected = false
        }
        else {
            updateInfoView.passTF.isSecureTextEntry = false
            sender.isSelected = true
        }
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
        UserDefaultsManager.shared().serviceCity = ""
        UserDefaultsManager.shared().serviceCityId = 0
        self.present(signIn, animated: true, completion: nil)
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let address = UpdateAddressVC.create()
        address.modalPresentationStyle = .fullScreen
        address.modalTransitionStyle = .coverVertical
        address.userInfo = userInfo
        self.present(address, animated: true, completion: nil)
    }
    
    @IBAction func contactPressed(_ sender: Any) {
        let contact = UpdateContactVC.create()
        contact.modalPresentationStyle = .fullScreen
        contact.modalTransitionStyle = .coverVertical
        contact.userInfo = userInfo
        self.present(contact, animated: true, completion: nil)
    }
    func update() {
        guard let fname = updateInfoView.fNameTF.text , fname != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterFirstName.localized)
            return
        }
        guard let lname = updateInfoView.lNameTF.text , lname != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterLastName.localized)
            return
        }
        guard let pass = updateInfoView.passTF.text , pass != "" else {
            self.show_Alert(L10n.sorry.localized, L10n.pleaseEnterPassword.localized)
            return
        }
        self.view.showLoader()
        APIManager.updateUser(id: UserDefaultsManager.shared().userId ?? 0,fname: fname, lname: lname, email: self.userInfo.email ?? "", password: pass, phone: self.userInfo.phone!, address: self.userInfo.address!, latitude: self.userInfo.latitude!, longitude: self.userInfo.longitude!, image: img) { (response) in
            switch response {
            case .failure(let err):
                print(err)
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                print(result)
                self.view.hideLoader()
                if self.changePass {
                    let signIn = SignInVC.create()
                    UserDefaultsManager.shared().Token = ""
                    UserDefaultsManager.shared().Email = ""
                    UserDefaultsManager.shared().phone = ""
                    UserDefaultsManager.shared().userId = 0
                    UserDefaultsManager.shared().Password = ""
                    self.present(signIn, animated: true, completion: nil)
                }
                else {
                    let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                    let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                    self.present(tabVC, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        if userInfo.image == self.img {
            if userInfo.fname == updateInfoView.fNameTF.text {
                if userInfo.lname == updateInfoView.lNameTF.text {
                    if UserDefaultsManager.shared().Password == updateInfoView.passTF.text{
                        self.show_Alert(L10n.sorry.localized, L10n.youDidnTUpdateAnyThing.localized)
                    }
                    else {
                        changePass = true
                        self.update()
                    }
                }
                else {
                    self.update()
                }
            }
            else {
                self.update()
            }
        }
        else {
            self.update()
        }
    }
    
}
extension UpdateInfoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        updateInfoView.userImg.image = image
        self.view.showLoader()
        APIManager.uploadPhoto(image: image!) { (err, imag) in
            self.img = imag?.data ?? ""
            print(self.img)
            self.view.hideLoader()
            
        }
        
        picker.dismiss(animated: false, completion: nil)
    }
}
