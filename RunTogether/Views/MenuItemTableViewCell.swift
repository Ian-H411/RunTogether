//
//  MenuItemTableViewCell.swift
//  RunTogether
//
//  Created by Ian Hall on 8/5/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    @IBOutlet weak var MenuCellTitle: UIImageView!
    
    @IBOutlet weak var backgroundPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
