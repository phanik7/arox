//
//  RecentlyViewedCollectionViewCell.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class RecentlyViewedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var recentlyViewedUserNameLbl: UILabel!
    @IBOutlet weak var recentlyViewedUserImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.parentView.layer.cornerRadius = 10
        self.parentView.layer.borderWidth = 1.5
        self.parentView.layer.borderColor = UIColor.lightGray.cgColor
        self.parentView.layer.masksToBounds = true
    }
}
