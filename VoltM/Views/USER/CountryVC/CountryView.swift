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
    @IBOutlet weak var countryCollection: UICollectionView!
    var itemSize1 = CGSize(width: 0, height: 0)
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            header.text = "الدوله"
            headerDesc.text = "اختار الدوله"
        }
    }
    func determineCollectionViewSpacing(){
        if let layout = countryCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemPerRow: CGFloat = 2
            
            let width = 104
            let height = 104
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 10
            layout.estimatedItemSize = itemSize1
            itemSize1 = CGSize(width: width, height: height)
        }
    }
}
