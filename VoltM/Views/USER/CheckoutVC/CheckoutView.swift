//
//  CheckoutView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/3/21.
//

import UIKit

class CheckoutView: UIView {

    @IBOutlet weak var checkoutHeader: UILabel!
    
    @IBOutlet weak var deliverAddressHeader: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var orderInfoHeader: UILabel!
    
    @IBOutlet weak var deliveryTimeView: UIView!
    
    @IBOutlet weak var deliverTimeHeader: UILabel!
    
    @IBOutlet weak var secondDeliveryTimeHeader: UILabel!
    
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    
    @IBOutlet weak var subtotalHeader: UILabel!
    
    @IBOutlet weak var deliveryHeader: UILabel!
    
    @IBOutlet weak var totalPriceHeader: UILabel!
    
    @IBOutlet weak var subtotalVal: UILabel!
    
    @IBOutlet weak var deliveryVal: UILabel!
    
    @IBOutlet weak var totalPriceVal: UILabel!
    
    @IBOutlet weak var payView: UIView!
    
    @IBOutlet weak var cashHeader: UILabel!
    
    @IBOutlet weak var payHeader: UILabel!
    @IBOutlet weak var continueDesign: UIButton!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            checkoutHeader.text = "تأكيد الطلب"
            deliverAddressHeader.text = "عنوان التوصيل"
            orderInfoHeader.text = "معلومات عن الطلب"
            deliverTimeHeader.text = "تحديد وقت التسليم"
            secondDeliveryTimeHeader.text = "الوقت المتوقع للتسليم خلال"
            subtotalHeader.text = "سعر الطلب"
            deliveryHeader.text = "التوصيل"
            totalPriceHeader.text = "السعر الكلي"
            payHeader.text = "إدفع بواسطه"
            cashHeader.text = "نقدا عند التسليم"
            continueDesign.setTitle("تأكيد", for: .normal)
        }
        addressLabel.text = UserDefaultsManager.shared().address
        addressView.setCornerRadius(radius: 16)
        deliveryTimeView.setCornerRadius(radius: 16)
        payView.setCornerRadius(radius: 16)
        continueDesign.setCornerRadius(radius: 8)
        
    }
    
    
}
