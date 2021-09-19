//
//  CartTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
