//
//  ProductVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var productView: ProductView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> ProductVC {
        let productVC: ProductVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.productVC)
        return productVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productView.productTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! ProductTableViewCell
        cell.productImage.setCornerRadius(radius: 8)
        cell.ratePressedCompletion = { [weak self] in
            let rate = RateVC.create()
            self?.present(rate, animated: true, completion: nil)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = ProductDetailsVC.create()
        details.modalPresentationStyle = .overCurrentContext
        self.present(details, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
