//
//  ViewController.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet var welcomeView: WelcomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeView.updateUI()
    }
    class func create() -> WelcomeVC {
        let welcomeVC: WelcomeVC = UIViewController.create(storyboardName: Storyboards.main, identifier: ViewControllers.welcomeVC)
        return welcomeVC
    }
    @IBAction func getStartedPressed(_ sender: Any) {
        
    }
    
}

