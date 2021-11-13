//
//  ProductTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/19/21.
//

import UIKit
import Cosmos
class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favDesign: UIButton!
    @IBOutlet weak var productRate: CosmosView!
    var ratePressedCompletion: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favPressed(_ sender: Any) {
    }
    
    @IBAction func cartPressed(_ sender: Any) {
    }
    
    @IBAction func ratePressed(_ sender: Any) {
        ratePressedCompletion?()
    }
}