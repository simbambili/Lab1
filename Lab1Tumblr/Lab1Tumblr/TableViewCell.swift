//
//  TableViewCell.swift
//  Lab1Tumblr
//
//  Created by Shaz Rajput on 7/16/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit
import AFNetworking

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tumblrImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
