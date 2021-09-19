//
//  MainCategoryVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class MainCategoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var mainCategoryView: MainCategoryView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainCategoryView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> MainCategoryVC {
        let mainCategoryVC: MainCategoryVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.mainCategoryVC)
        return mainCategoryVC
    }

//    @IBAction func backPressed(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainCategoryView.categoryTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! MainCategoryTableViewCell
         
        cell.mainView.setCornerRadius(radius: 10)
        cell.catImage.setCornerRadius(radius: 10)
        cell.catView.dropShadow(radius: 8, shadow: 2)
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let store = StoreVC.create()
        self.present(store, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.mainCategoryView.categoryTableView.frame.height / 2
    }
}
