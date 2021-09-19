//
//  UpdateInfoVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateInfoVC: UIViewController {

    @IBOutlet var updateInfoView: UpdateInfoView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfoView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> UpdateInfoVC {
        let updateInfoVC: UpdateInfoVC = UIViewController.create(storyboardName: Storyboards.account, identifier: ViewControllers.updateInfoVC)
        return updateInfoVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func eyePressed(_ sender: Any) {
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
    }
    
    @IBAction func addressPressed(_ sender: Any) {
        let address = UpdateAddressVC.create()
        address.modalPresentationStyle = .fullScreen
        address.modalTransitionStyle = .coverVertical
        self.present(address, animated: true, completion: nil)
    }
    
    @IBAction func contactPressed(_ sender: Any) {
    }
    
    @IBAction func updatePressed(_ sender: Any) {
    }
    
}
