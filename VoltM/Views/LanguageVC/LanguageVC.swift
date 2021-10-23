//
//  LanguageVC.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit
import MOLH

class LanguageVC: UIViewController {

    @IBOutlet var languageView: LanguageView!
    var delegate: SideMenuVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        languageView.updateUI()
        if L10n.lang.localized == Language.arabic {
            
            languageView.arabicView.backgroundColor = #colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1)
            languageView.englishView.backgroundColor = .white
        }
        else {
            self.languageView.englishView.backgroundColor = #colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1)
            languageView.arabicView.backgroundColor = .white
        }
        // Do any additional setup after loading the view.
    }
    class func create() -> LanguageVC {
        let languageVC: LanguageVC = UIViewController.create(storyboardName: Storyboards.sideMenu, identifier: ViewControllers.languageVC)
        return languageVC
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.showTable()
        }
    }
    @IBAction func englishPressed(_ sender: Any) {
        languageView.englishView.backgroundColor = #colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1)
        languageView.arabicView.backgroundColor = .white
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "en" : "en")
        exit(-1)
    }
    
    
    @IBAction func arabicPressed(_ sender: Any) {
        languageView.arabicView.backgroundColor = #colorLiteral(red: 1, green: 0.8431372549, blue: 0, alpha: 1)
        languageView.englishView.backgroundColor = .white
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "ar" ? "ar" : "ar")
        exit(-1)
    }
    
}
