//
//  Item+CoreDataProperties.swift
//  POS
//
//  Created by Amit  Singh on 9/15/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var albumId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var thumbnailUrl: String?
    @NSManaged public var price: Float

}
