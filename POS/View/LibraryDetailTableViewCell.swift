//
//  LibraryDetailTableViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class LibraryDetailTableViewCell: UITableViewCell {
    @IBOutlet var imageViewLogo: UIImageView!
    @IBOutlet var labelTitle: UILabel!

    @IBOutlet var labelValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
