//
//  DeliveryInfoView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/3/21.
//

import UIKit

class DeliveryInfoView: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTF: HooopTextfield!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryTF: HooopTextfield!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressTF: HooopTextfield!
    @IBOutlet weak var goverView: UIView!
    @IBOutlet weak var goverTF: HooopTextfield!
    @IBOutlet weak var phoneIcon: UIImageView!
    @IBOutlet weak var addressIcon: UIImageView!
    @IBOutlet weak var countryDesign: UIButton!
    
    @IBOutlet weak var backDesign: UIButton!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            countryDesign.setTitle(L10n.continue.localized, for: .normal)
            header.text = "معلومات التوصيل"
            backDesign.setImage(Asset.backAr.image, for: .normal)
            phoneTF.placeholder = "رقم التليفون"
            phoneTF.textAlignment = .right
            countryTF.placeholder = "الدوله"
            countryTF.textAlignment = .right
            addressTF.placeholder = "العنوان"
            addressTF.textAlignment = .right
            phoneIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
            addressIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        phoneTF.text = UserDefaultsManager.shared().phone
        countryTF.text = UserDefaultsManager.shared().country
        addressTF.text = UserDefaultsManager.shared().address
        countryDesign.setCornerRadius(radius: 8)
        phoneView.setCornerRadius(radius: 8)
        countryView.setCornerRadius(radius: 8)
        addressView.setCornerRadius(radius: 8)
        goverView.setCornerRadius(radius: 8)
        
    }
    
}
