//
//  SideMenuVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit
protocol sideMenuProtocol: AnyObject {
    func showTable()
}
class SideMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate, sideMenuProtocol {
    func showTable() {
        self.sideMenuView.sideMenuTableView.isHidden = false
    }
    
 

    @IBOutlet var sideMenuView: SideMenuView!
    var menuNameEn = ["Orders", "Offers", "Country", "Languages", "Privacy Policy", "Who Are We?", "Support", "Account"]
    var menuImg = [Asset.orderImg.image, Asset.offerImg.image, Asset.countryImg.image,Asset.languageImg.image, Asset.privacyImage.image, Asset.aboutImg.image, Asset.supportImg.image, Asset.accountImg.image]
    var menuNameAr = ["الطلبات", "العروض", "الدول", "اللغه", "سياسه الخصوصيه", "من نحن؟", "الدعم", "حسابك"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    class func create() -> SideMenuVC {
        let sideMenuVC: SideMenuVC = UIViewController.create(storyboardName: Storyboards.sideMenu, identifier: ViewControllers.sideMenuVC)
        return sideMenuVC
    }

    @IBAction func sideMenuPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameEn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.sideMenuView.sideMenuTableView.dequeueReusableCell(withIdentifier: TableCells.homeCell, for: indexPath) as! SideMenuTableViewCell
        cell.menuImage.image = menuImg[indexPath.row]
        if L10n.lang.localized == Language.arabic {
            cell.menuName.text = menuNameAr[indexPath.row]
        }
        else {
            cell.menuName.text = menuNameEn[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let order = OrdersVC.create()
            order.modalPresentationStyle = .fullScreen
            order.modalTransitionStyle = .crossDissolve
            self.present(order, animated: true, completion: nil)
            
        }
        
        if indexPath.row == 1 {
            let offer = OfferVC.create()
            offer.modalPresentationStyle = .fullScreen
            offer.modalTransitionStyle = .crossDissolve
            self.present(offer, animated: true, completion: nil)
            
        }
        if indexPath.row == 2 {
            self.sideMenuView.sideMenuTableView.isHidden = true
            let country = CountryVC.create()
            country.delegate = self
            country.modalPresentationStyle = .overCurrentContext
            country.modalTransitionStyle = .crossDissolve
            self.present(country, animated: true, completion: nil)
            
        }
        if indexPath.row == 3 {
            self.sideMenuView.sideMenuTableView.isHidden = true
            let lang = LanguageVC.create()
            lang.delegate = self
            lang.modalPresentationStyle = .overCurrentContext
            lang.modalTransitionStyle = .crossDissolve
            self.present(lang, animated: true, completion: nil)
            
        }
        if indexPath.row == 5{
            let about = AboutUsVC.create()
            about.modalPresentationStyle = .fullScreen
            about.modalTransitionStyle = .crossDissolve
            self.present(about, animated: true, completion: nil)
            
        }
        if indexPath.row == 6{
            guard let number = URL(string: "tel://" + "0500472089") else { return }
            UIApplication.shared.open(number)
        }
        
        if indexPath.row == 7 {
            let account = UpdateInfoVC.create()
            account.modalPresentationStyle = .fullScreen
            account.modalTransitionStyle = .crossDissolve
            self.present(account, animated: true, completion: nil)
            
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}