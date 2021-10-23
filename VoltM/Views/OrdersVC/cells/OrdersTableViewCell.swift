//
//  OrdersTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/27/21.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderImage: UIImageView!
    
    @IBOutlet weak var orderNumber: UILabel!
    
    @IBOutlet weak var orderStatus: UILabel!
    
    @IBOutlet weak var orderDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
