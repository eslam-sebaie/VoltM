//
//  UpdateContactVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/20/21.
//

import UIKit

class UpdateContactVC: UIViewController {

    
    @IBOutlet var updateContactView: UpdateContactView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContactView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> UpdateContactVC {
        let updateContactVC: UpdateContactVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateContactVC)
        return updateContactVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let address = UpdateAddressVC.create()
        address.modalPresentationStyle = .fullScreen
        address.modalTransitionStyle = .coverVertical
        self.present(address, animated: true, completion: nil)
    }
    
    @IBAction func infoPressed(_ sender: Any) {
        let account = UpdateInfoVC.create()
        account.modalPresentationStyle = .fullScreen
        account.modalTransitionStyle = .coverVertical
        self.present(account, animated: true, completion: nil)
    }
    @IBAction func updatePressed(_ sender: Any) {
    }
    
    @IBAction func phonePressed(_ sender: Any) {
    }
    
}
