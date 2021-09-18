//
//  homeTableViewCell.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/18/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var sectionImage: UIImageView!
    
    @IBOutlet weak var sectionView: UIView!
    @IBOutlet weak var sectionName: UILabel!
    
    @IBOutlet weak var sectionIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
