//
//  ItemTableViewCell.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet var imageItem: UIImageView!
    @IBOutlet var labelItemName: UILabel!
    @IBOutlet var labelItemPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setItemCell(item: Item) {
        imageItem.imageFromServerURL(item.thumbnailUrl!, placeHolder: UIImage(named: "logo"))
        labelItemName.text = item.title
        labelItemPrice.text = "$ \(item.price)"
    }
}
