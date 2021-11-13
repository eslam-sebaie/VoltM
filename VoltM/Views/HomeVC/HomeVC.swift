//
//  HomeVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet var homeView: HomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.offerDesign.setCornerRadius(radius: 10)
        if L10n.lang.localized == Language.arabic {
            self.homeView.offerImage.image = Asset.offerAr.image
        }
        else {
            self.homeView.offerImage.image = Asset.offers.image
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.homeView.homeTableView.reloadData()
    }
    
    class func create() -> HomeVC {
        let homeVC: HomeVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.homeVC)
        return homeVC
    }
    
   
    @IBAction func sideMenuPressed(_ sender: Any) {
        let side = SideMenuVC.create()
        side.modalPresentationStyle = .overCurrentContext
        side.modalTransitionStyle = .crossDissolve
        self.present(side, animated: true, completion: nil)
    }
    
    @IBAction func offerPressed(_ sender: Any) {
        let offer = OfferVC.create()
        self.present(offer, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.homeTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! HomeTableViewCell
        
        cell.mainView.setCornerRadius(radius: 10)
        cell.sectionView.dropShadow(radius: 10, shadow: 2)
        if indexPath.row == 0 {
            cell.sectionImage.image = Asset.storeBG.image
            cell.sectionName.text = L10n.store.localized
            cell.sectionIcon.image = Asset.shop.image
        }
        else {
            cell.sectionImage.image = Asset.serviceBG.image
            cell.sectionName.text = L10n.service.localized
            cell.sectionIcon.image = Asset.tools.image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
            let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController") as! UITabBarController
            tabVC.selectedIndex = 1
            self.present(tabVC, animated: true, completion: nil)
        }
        else {
            let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
            let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController") as! UITabBarController
            tabVC.selectedIndex = 2
            self.present(tabVC, animated: true, completion: nil)
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.homeView.homeTableView.frame.height / 2
    }
}
