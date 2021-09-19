//
//  CountryView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CountryView: UIView {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var headerDesc: UILabel!
    
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            header.text = "الدوله"
            headerDesc.text = "اختار الدوله"
        }
    }

}
