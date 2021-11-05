//
//  ChooseCountryView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 11/5/21.
//

import UIKit

class ChooseCountryView: UIView {

    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    @IBOutlet weak var backDesign: UIButton!
    var itemSize1 = CGSize(width: 0, height: 0)

    func determineCollectionViewSpacing(){
        if let layout = countryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemPerRow: CGFloat = 2
            
            let width = 104
            let height = 104
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 10
            layout.estimatedItemSize = itemSize1
            itemSize1 = CGSize(width: width, height: height)
        }
    }
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            backDesign.setImage(Asset.backAr.image, for: .normal)
        }
    }
}
