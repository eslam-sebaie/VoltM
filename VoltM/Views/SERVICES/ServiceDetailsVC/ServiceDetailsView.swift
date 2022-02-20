//
//  ServiceDetailsView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/12/21.
//

import UIKit

class ServiceDetailsView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var requestHeader: UILabel!
    @IBOutlet weak var serviceImage: UIImageView!
    
    @IBOutlet weak var serviceName: UILabel!
    
    @IBOutlet weak var servicePrice: UILabel!
    
    @IBOutlet weak var noteHeader: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var noteTV: UITextView!
    
    @IBOutlet weak var requestDesign: UIButton!
    
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            requestHeader.text = "الطلب"
            noteHeader.text = "ملاحظه"
            backDesign.setImage(Asset.backAr.image, for: .normal)
            requestDesign.setTitle("إطلب", for: .normal)

        }
        serviceImage.setCornerRadius(radius: 10)
        noteTV.setCornerRadius(radius: 10)
        mainView.setCornerRadius(radius: 20)
        requestDesign.setCornerRadius(radius: 10)
    }
    
}
