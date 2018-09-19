//
//  Discount+CoreDataProperties.swift
//  POS
//
//  Created by Amit  Singh on 9/19/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//
//

import CoreData
import Foundation

extension Discount {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Discount> {
        return NSFetchRequest<Discount>(entityName: "Discount")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Double
    @NSManaged public var id: Int32
}
