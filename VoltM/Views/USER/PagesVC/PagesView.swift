//
//  PagesView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class PagesView: UIView {

    @IBOutlet weak var pagesCollection: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextDesign: UIButton!
    
    func updateUI(){
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2)
        nextDesign.setCornerRadius(radius: 8)
        
        if L10n.lang.localized == Language.arabic {
            nextDesign.setTitle("التالي", for: .normal)
            
        }
    }
}
