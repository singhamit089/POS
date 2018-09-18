//
//  DiscountTableViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {
    @IBOutlet var imageViewLogo: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDiscount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(with discout: DiscountModel) {
        imageViewLogo.image = UIImage(named: discout.logo)
        labelTitle.text = discout.title
        labelDiscount.text = "\(discout.discount) %"
    }
}
