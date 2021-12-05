//
//  AboutUsView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/4/21.
//

import UIKit

class AboutUsView: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var backDesign: UIButton!
    @IBOutlet weak var aboutLabel: UILabel!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
            aboutLabel.textAlignment = .right
            header.text = "من نحن"
            aboutLabel.text = "تطبيق مُختص بالصيانة الكهربائية المنزلية يتيح لك إمكانية طلب فنيّين مُختصين يوصلون لك لحد بيتك \n بالأضافه إلي وجود أقسام داخل التطبيق مختصه \n قسم مجال الاناره \n قسم مجال الاتصالات \n من مختلف المحالات المحليه بأرض الواقع تقوم بالطلب وتوصلك بالوقت المحدد \n \n فنحن حلقه وصل بينك وبين مزود الخدمات المقدمه"
        }
    }
}
