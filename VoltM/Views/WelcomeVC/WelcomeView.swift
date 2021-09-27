//
//  WelcomeView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/25/21.
//

import UIKit

class WelcomeView: UIView {

    @IBOutlet weak var getStartedDesign: UIButton!
    
    func updateUI(){
        getStartedDesign.setCornerRadius(radius: 8)
    }

}
