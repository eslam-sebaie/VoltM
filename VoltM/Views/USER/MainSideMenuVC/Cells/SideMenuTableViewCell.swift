//
//  SideMenuTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var menuName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
