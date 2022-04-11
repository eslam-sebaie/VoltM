//
//  ServiceDetailsVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/12/21.
//

import UIKit

class ServiceDetailsVC: UIViewController {

    @IBOutlet var serviceDetailsView: ServiceDetailsView!
    var subServiceInfo = ServiceInfo(id: 0, name: ProductLocalize(en: "", ar: ""), image: "", price: 0)
    var imageLoader = ImageLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceDetailsView.updateUI()
        let price = subServiceInfo.price ?? 0
        
        if L10n.lang.localized == Language.arabic {
            serviceDetailsView.serviceName.text = subServiceInfo.name.ar
            if price == 0 || price == 0.0 {
                serviceDetailsView.servicePrice.text = "حسب الاتفاق"
            }
            else {
                serviceDetailsView.servicePrice.text = "\(subServiceInfo.price ?? 0) \(getCountryCurrency())"
            }
        }
        else {
            serviceDetailsView.serviceName.text = subServiceInfo.name.en
            if price == 0 || price == 0.0 {
                serviceDetailsView.servicePrice.text = "UAG"
            }
            else {
                serviceDetailsView.servicePrice.text = "\(subServiceInfo.price ?? 0) \(getCountryCurrency())"
            }
        }
        
        let img = subServiceInfo.image
        let image = img.replace(string: " ", replacement: "%20")
        imageLoader.obtainImageWithPath(imagePath: image) { (image) in
            self.serviceDetailsView.serviceImage.image = image

        }
        // Do any additional setup after loading the view.
    }
    
    class func create() -> ServiceDetailsVC {
        let serviceDetailsVC: ServiceDetailsVC = UIViewController.create(storyboardName: Storyboards.home, identifier: ViewControllers.serviceDetailsVC)
        return serviceDetailsVC
    }
   
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func requestPressed(_ sender: Any) {
        guard let note = serviceDetailsView.noteTV.text, note != "" else {
            self.show_Alert(L10n.please.localized, L10n.enterNotes.localized)
            return
        }
        self.view.showLoader()
        APIManager.serviceOrder(services_id: subServiceInfo.id, user_id: UserDefaultsManager.shared().userId ?? 0, notes: note) { response in
            switch response {
            case .failure( _):
                self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                self.view.hideLoader()
            case .success(let result):
                if result.status {
                    let storyboard = UIStoryboard(name: Storyboards.home, bundle: nil)
                    let tabVC = storyboard.instantiateViewController(withIdentifier: "tabViewController")
                    self.view.hideLoader()
                    tabVC.modalTransitionStyle = .crossDissolve
                    self.present(tabVC, animated: true, completion: nil)
                   
                }
                else {
                    self.show_Alert(L10n.sorry.localized, L10n.wentWrong.localized)
                    self.view.hideLoader()
                }
            }
        }
    }
    
}
