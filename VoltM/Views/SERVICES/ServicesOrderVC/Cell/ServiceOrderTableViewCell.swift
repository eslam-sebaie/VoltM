//
//  ServiceOrderTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 12/14/21.
//

import UIKit

class ServiceOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceName: UILabel!
    
    @IBOutlet weak var servicePrice: UILabel!
    @IBOutlet weak var subServiceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
