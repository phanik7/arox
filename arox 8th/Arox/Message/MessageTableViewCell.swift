//
//  MessageTableViewCell.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
