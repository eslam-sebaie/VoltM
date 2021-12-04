//
//  AboutUsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/4/21.
//

import UIKit

class AboutUsVC: UIViewController {

    @IBOutlet var aboutView: AboutUsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> AboutUsVC {
        let aboutUsVC: AboutUsVC = UIViewController.create(storyboardName: Storyboards.sideMenu, identifier: ViewControllers.aboutUsVC)
        return aboutUsVC
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
