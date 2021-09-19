//
//  ProductDetailsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet var productDetailsView: ProductDetailsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailsView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> ProductDetailsVC {
        let productDetailsVC: ProductDetailsVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.productDetailsVC)
        return productDetailsVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func stepperPressed(_ sender: Any) {
    }
    
    @IBAction func continuePressed(_ sender: Any) {
    }
    
}
