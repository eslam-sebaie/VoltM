//
//  PaymentMethodCollectionViewCell.swift
//  VoltM
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit
import MFSDK

class PaymentMethodCollectionViewCell: UICollectionViewCell {
    //MARK: Variables
    
    //MARK: Outlets
    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymentMethodNameLabel: UILabel!
    
    //MARK Methods
    func configure(paymentMethod: MFPaymentMethod, selected: Bool) {
        paymentMethodImageView.image = nil
        paymentMethodImageView.layer.cornerRadius = 5
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        if selected {
            if #available(iOS 13.0, *) {
                self.layer.borderColor = ColorName.btnColor.color.cgColor
            } else {
                self.layer.borderColor = ColorName.btnColor.color.cgColor
            }
            self.layer.borderWidth = 3
        } else {
            self.layer.borderWidth = 0
        }
        if let imageURL = paymentMethod.imageUrl {
            paymentMethodImageView.downloaded(from: imageURL)
        }
        paymentMethodNameLabel.text = paymentMethod.paymentMethodEn ?? ""
        
    }
}
