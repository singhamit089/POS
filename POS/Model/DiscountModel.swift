//
//  DiscountModel.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

struct DiscountModel {
    var title: String
    var discount: Double
    var logo: String
    var id: Int

    init(title: String, discount: Double, id: Int) {
        self.title = title
        self.discount = discount
        logo = "icon-percentage"
        self.id = id
    }

    public static func getDiscountDataSource() -> [DiscountModel] {
        var someArray = Array<DiscountModel>()

        someArray.append(DiscountModel(title: "Discount A", discount: 0, id: 1))
        someArray.append(DiscountModel(title: "Discount B", discount: 10, id: 2))
        someArray.append(DiscountModel(title: "Discount C", discount: 35.5, id: 3))
        someArray.append(DiscountModel(title: "Discount D", discount: 50, id: 4))
        someArray.append(DiscountModel(title: "Discount E", discount: 100, id: 5))

        return someArray
    }
}
