//
//  SubServiceTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/9/21.
//

import UIKit

class SubServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var subServiceImage: UIImageView!
    @IBOutlet weak var subServiceName: UILabel!
    @IBOutlet weak var subServicePrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
