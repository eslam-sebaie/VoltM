//
//  OfferVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class OfferVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet var offerView: OfferView!
    override func viewDidLoad() {
        super.viewDidLoad()
        offerView.updateUI()
    }
    

    class func create() -> OfferVC {
        let offerVC: OfferVC = UIViewController.create(storyboardName: Storyboards.offer, identifier: ViewControllers.offerVC)
        return offerVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.offerView.offerTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! OfferTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.offerImage.setCornerRadius(radius: 10)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
}
