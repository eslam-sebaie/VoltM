//
//  CheckoutVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/3/21.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet var checkoutView: CheckoutView!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkoutView.updateUI()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backPressed(_ sender: Any) {
    }
    
    @IBAction func continuePressed(_ sender: Any) {
    }
    
}
