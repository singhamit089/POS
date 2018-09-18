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
    var discount: Float
    var logo: String

    init(title: String, discount: Float) {
        self.title = title
        self.discount = discount
        logo = "icon-percentage"
    }

    private init() {
        title = ""
        discount = 0
        logo = "icon-percentage"
    }

    public static func getDiscountDataSource() -> [DiscountModel] {
        var someArray = Array<DiscountModel>()

        someArray.append(DiscountModel(title: "Discount A", discount: 0))
        someArray.append(DiscountModel(title: "Discount B", discount: 10))
        someArray.append(DiscountModel(title: "Discount C", discount: 35.5))
        someArray.append(DiscountModel(title: "Discount D", discount: 50))
        someArray.append(DiscountModel(title: "Discount E", discount: 100))

        return someArray
    }
}
