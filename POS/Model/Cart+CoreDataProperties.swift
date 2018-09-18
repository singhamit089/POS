//
//  Cart+CoreDataProperties.swift
//  POS
//
//  Created by Amit  Singh on 9/18/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var quantity: Int32
    @NSManaged public var items: Item?
    @NSManaged public var discounts: Discount?

}
