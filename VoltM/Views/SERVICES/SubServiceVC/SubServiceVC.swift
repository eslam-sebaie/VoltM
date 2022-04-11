//
//  SubServicesVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/9/21.
//

import UIKit
import SDWebImage
class SubServiceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var subServiceView: SubServiceView!
    var receiveServiceID = 0
    var subServiceInfo = [ServiceInfo]()
    var imageLoader = ImageLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        if L10n.lang.localized == Language.arabic {
            subServiceView.subServiceHeader.text = "خدمات فرعيه"
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getSubServices()
    }
    
    func getSubServices() {
        self.view.showLoader()
        APIManager.getSubServices(services_id: receiveServiceID) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                
                if result.status {
                    self.subServiceInfo = result.data ?? []
                    self.subServiceView.subServiceTableView.reloadData()
                    self.view.hideLoader()
                }
                else {
                    self.subServiceInfo = result.data ?? []
                    self.subServiceView.subServiceTableView.reloadData()
                    self.show_Alert(L10n.sorry.localized, L10n.noSubServiceFound.localized)
                    self.view.hideLoader()
                }
            }
        }
    }
    
    class func create() -> SubServiceVC {
        let subServiceVC: SubServiceVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.subServiceVC)
        return subServiceVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subServiceInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subServiceView.subServiceTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SubServiceTableViewCell
        cell.subServiceImage.setCornerRadius(radius: 8)
        let img = subServiceInfo[indexPath.row].image
        let image = img.replace(string: " ", replacement: "%20")
        imageLoader.obtainImageWithPath(imagePath: image) { (image) in
            cell.subServiceImage.image = image

        }
        let price = subServiceInfo[indexPath.row].price ?? 0
        if L10n.lang.localized == Language.arabic {
            cell.subServiceName.text = subServiceInfo[indexPath.row].name.ar
            if price == 0 || price == 0.0 {
                cell.subServicePrice.text = "حسب الاتفاق"
            }
            else {
                cell.subServicePrice.text = "\(subServiceInfo[indexPath.row].price ?? 0) \(getCountryCurrency())"
            }
        }
        else {
            cell.subServiceName.text = subServiceInfo[indexPath.row].name.en
            if price == 0 || price == 0.0 {
                cell.subServicePrice.text = "UAG"
            }
            else {
                cell.subServicePrice.text = "\(subServiceInfo[indexPath.row].price ?? 0) \(getCountryCurrency())"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subService = ServiceDetailsVC.create()
        subService.subServiceInfo = subServiceInfo[indexPath.row]
        subService.modalPresentationStyle = .overCurrentContext
        self.present(subService, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
extension String {
   func replace(string:String, replacement:String) -> String {
       return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
   }

   func removeWhitespace() -> String {
       return self.replace(string: " ", replacement: "")
   }
 }
