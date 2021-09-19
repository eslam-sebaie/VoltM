//
//  UpdateAddressVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateAddressVC: UIViewController {

    @IBOutlet var updateAddressView: UpdateAddressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAddressView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> UpdateAddressVC {
        let updateAddressVC: UpdateAddressVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateAddressVC)
        return updateAddressVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
    }
    
    @IBAction func infoPressed(_ sender: Any) {
        let account = UpdateInfoVC.create()
        account.modalPresentationStyle = .fullScreen
        account.modalTransitionStyle = .coverVertical
        self.present(account, animated: true, completion: nil)
    }
    @IBAction func contactPressed(_ sender: Any) {
    }
    
    @IBAction func updatePressed(_ sender: Any) {
    }
    
}
