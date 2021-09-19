//
//  CountryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CountryVC: UIViewController {

    @IBOutlet var countryView: CountryView!
    var delegate: sideMenuProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        countryView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> CountryVC {
        let countryVC: CountryVC = UIViewController.create(storyboardName: Storyboards.sideMenu, identifier: ViewControllers.countryVC)
        return countryVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.showTable()
        }
    }
    
    

}
