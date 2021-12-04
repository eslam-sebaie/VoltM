//
//  ProductDetailsView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class ProductDetailsView: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var stepperVal: UIStepper!
    @IBOutlet weak var continueDesign: UIButton!
    
    @IBOutlet weak var favDesign: UIButton!
    @IBOutlet weak var backDesign: UIButton!
    func updateUI(){
        mainView.setCornerRadius(radius: 20)
        productImage.setCornerRadius(radius: 8)
        productQty.setCornerRadius(radius: 8)
        stepperVal.setCornerRadius(radius: 6)
        continueDesign.isEnabled = false
        continueDesign.backgroundColor = ColorName.diableButton.color
        continueDesign.setCornerRadius(radius: 9)
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            header.text = "Add to Cart".localized
            continueDesign.setTitle("Continue".localized, for: .normal)
        }
        
    }
}
