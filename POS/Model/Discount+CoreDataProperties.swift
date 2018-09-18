//
//  Discount+CoreDataProperties.swift
//  POS
//
//  Created by Amit  Singh on 9/18/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//
//

import Foundation
import CoreData


extension Discount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Discount> {
        return NSFetchRequest<Discount>(entityName: "Discount")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Int32

}
