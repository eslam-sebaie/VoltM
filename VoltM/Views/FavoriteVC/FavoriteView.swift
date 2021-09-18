//
//  FavoriteView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class FavoriteView: UIView {

    @IBOutlet weak var favoriteHeader: UILabel!
    @IBOutlet weak var favoriteTableView: UITableView!
    func updateUI(){
        if L10n.lang.localized == Language.arabic {
            favoriteHeader.text = "Favorites".localized
        }
    }
}
