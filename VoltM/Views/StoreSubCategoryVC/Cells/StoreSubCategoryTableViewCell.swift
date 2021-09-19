//
//  StoreSubCategoryTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreSubCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var subCatImage: UIImageView!
    
    @IBOutlet weak var subCatCardView: UIView!
    
    @IBOutlet weak var subCatName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
