//
//  MealTableViewCell.swift
//  FoodTrackerExample
//
//  Created by durban.zhang on 2017/5/22.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControlView: RatingControlView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
