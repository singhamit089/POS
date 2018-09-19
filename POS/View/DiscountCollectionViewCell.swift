//
//  DiscountCollectionViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/19/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    @IBOutlet var labelDiscount: UILabel!

    @IBOutlet var `switch`: UISwitch!

    @IBAction func switchTapAction(_: Any) {}

    override func awakeFromNib() {
        super.awakeFromNib()

        `switch`.isUserInteractionEnabled = false
    }
}
