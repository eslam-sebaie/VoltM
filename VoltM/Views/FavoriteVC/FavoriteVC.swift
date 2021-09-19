//
//  FavoriteVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class FavoriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var favoriteView: FavoriteView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.updateUI()
        // Do any additional setup after loading the view.
    }
    class func create() -> FavoriteVC {
        let favoriteVC: FavoriteVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.favoriteVC)
        return favoriteVC
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.favoriteView.favoriteTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! FavoriteTableViewCell
        cell.mainView.setCornerRadius(radius: 10)
        cell.productImage.setCornerRadius(radius: 10)
        cell.productCardView.dropShadow(radius: 8, shadow: 2)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
   
}
