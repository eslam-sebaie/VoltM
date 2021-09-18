//
//  StoreVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var storeView: StoreView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storeView.updateUI()
        // Do any additional setup after loading the view.
    }
    
    class func create() -> StoreVC {
        let storeVC: StoreVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.storeVC)
        return storeVC
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
        let cell = self.storeView.storeTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! StoreTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.storeImage.setCornerRadius(radius: 10)
        cell.storeCardView.dropShadow(radius: 10, shadow: 2)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
