//
//  DiscountCollectionViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/19/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelDiscount: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBAction func switchTapAction(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.switch.isUserInteractionEnabled = false
    }

}
