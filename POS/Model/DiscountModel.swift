//
//  DiscountModel.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

struct DiscountModel {
    var title:String
    var discount:Float
    var logo:String
    
    
    init(title:String,discount:Float) {
        self.title = title
        self.discount = discount
        self.logo = "icon-percentage"
    }
    
    private init(){
        self.title = ""
        self.discount = 0
        self.logo = "icon-percentage"
    }
    
    public static func getDiscountDataSource()->[DiscountModel] {
        
        var array:[DiscountModel] = Array(repeating: DiscountModel(), count: 5)
        
        array[0] = DiscountModel(title: "Discount A", discount: 0)
        array[1] = DiscountModel(title: "Discount B", discount: 10)
        array[2] = DiscountModel(title: "Discount C", discount: 35.5)
        array[3] = DiscountModel(title: "Discount D", discount: 50)
        array[4] = DiscountModel(title: "Discount E", discount: 100)
        
        return array
    }
}
