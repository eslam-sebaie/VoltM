//
//  UpdateAddressView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class UpdateAddressView: UIView {

    
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var logOutDesign: UIButton!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var addressTF: HooopTextfield!
    
    @IBOutlet weak var addressImage: UIImageView!
    @IBOutlet weak var updateDesign: UIButton!
   
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countryIcon: UIImageView!
    @IBOutlet weak var countryTF: HooopTextfield!
    
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityIcon: UIImageView!
    @IBOutlet weak var cityTF: HooopTextfield!
    @IBOutlet weak var imageDesignButton: UIButton!
    @IBOutlet weak var locationButtonDesign: UIButton!
    
    @IBOutlet weak var updateHeight: NSLayoutConstraint!
    @IBOutlet weak var cityHeight: NSLayoutConstraint!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            addressTF.placeholder = "العنوان"
            addressTF.textAlignment = .right
            addressImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            
            countryTF.placeholder = "الدوله"
            countryTF.textAlignment = .right
            countryIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
            
            cityTF.placeholder = "المدينه"
            cityTF.textAlignment = .right
            cityIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        logOutDesign.setCornerRadius(radius: 8)
        userImage.setCornerRadius(radius: 45)
        addressView.setCornerRadius(radius: 8)
        countryView.setCornerRadius(radius: 8)
        cityView.setCornerRadius(radius: 8)
        updateDesign.setCornerRadius(radius: 8)
        
    }
    
}
