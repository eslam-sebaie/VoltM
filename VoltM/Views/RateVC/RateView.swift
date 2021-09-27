//
//  RateView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit
import Cosmos
class RateView: UIView {

    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var totalReview: UILabel!
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var reviewsCount: UILabel!
    @IBOutlet weak var rateTableView: UITableView!
    @IBOutlet weak var reviewDesign: UIButton!
    
    @IBOutlet weak var popRateView: UIView!
    @IBOutlet weak var rateHeader: UILabel!
    @IBOutlet weak var popProductImage: UIImageView!
    @IBOutlet weak var popProductName: UILabel!
    
    @IBOutlet weak var popProductPrice: UILabel!
    @IBOutlet weak var sendReviewDesign: UIButton!
    @IBOutlet weak var popRate: CosmosView!
    
    @IBOutlet weak var rateTF: HooopTextfield!
    
    func updateUI() {
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            reviewDesign.setTitle("اكتب تعليقك.", for: .normal)
            sendReviewDesign.setTitle("ارسال التعليق.", for: .normal)
            rateHeader.text = "قيم هذا المنتج."
            rateTF.placeholder = "اكتب تعليقك"
            rateTF.textAlignment = .right
        }
        
        popRate.rating = 0
        rate.settings.updateOnTouch = false
        popRate.settings.updateOnTouch = true
        popRate.settings.fillMode = .precise
        rate.settings.fillMode = .precise
        popRateView.isHidden = true
        popRateView.setCornerRadius(radius: 20)
        popProductImage.setCornerRadius(radius: 8)
        reviewDesign.setCornerRadius(radius: 8)
        sendReviewDesign.setCornerRadius(radius: 8)
        rateTF.setCornerRadius(radius: 8)
        
        
    }
}
