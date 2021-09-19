//
//  StoreTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeCardView: UIView!
    @IBOutlet weak var storeName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
