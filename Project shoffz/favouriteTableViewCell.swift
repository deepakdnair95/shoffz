//
//  favouriteTableViewCell.swift
//  Project shoffz
//
//  Created by iroid on 8/4/1402 AP.
//  Copyright © 1402 iroid. All rights reserved.
//

import UIKit

class favouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var brandname: UILabel!
    @IBOutlet weak var fooddetails: UILabel!
    @IBOutlet weak var deals: UILabel!
    @IBOutlet weak var deal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
