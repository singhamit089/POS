//
//  CartTableViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/19/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    @IBOutlet var labelItem: UILabel!

    @IBOutlet var labelQuantity: UILabel!
    @IBOutlet var labelPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
