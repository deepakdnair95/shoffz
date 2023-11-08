//
//  superdealTableViewCell.swift
//  
//
//  Created by iroid on 7/5/1402 AP.
//

import UIKit

class superdealTableViewCell: UITableViewCell {

    @IBOutlet weak var superimg: UIImageView!
    @IBOutlet weak var superdetails: UILabel!
    @IBOutlet weak var superingre: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
