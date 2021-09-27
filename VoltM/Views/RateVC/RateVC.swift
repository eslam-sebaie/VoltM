//
//  RateVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class RateVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet var rateView: RateView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rateView.updateUI()
        rateView.rateTableView.rowHeight = UITableView.automaticDimension
        rateView.rateTableView.estimatedRowHeight = 44
        
    }
    class func create() -> RateVC {
        let rateVC: RateVC = UIViewController.create(storyboardName: Storyboards.products, identifier: ViewControllers.rateVC)
        return rateVC
    }

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reviewPressed(_ sender: Any) {
        rateView.popRateView.isHidden = false
    }
    @IBAction func sendReviewPressed(_ sender: Any) {
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        rateView.popRateView.isHidden = true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.rateView.rateTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! RateTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
