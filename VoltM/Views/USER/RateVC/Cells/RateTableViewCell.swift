//
//  RateTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit
import Cosmos
class RateTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userDate: UILabel!
    @IBOutlet weak var userRate: CosmosView!
    @IBOutlet weak var rateReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.setCornerRadius(radius: 24)
        userRate.settings.updateOnTouch = false
        userRate.settings.fillMode = .precise
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
