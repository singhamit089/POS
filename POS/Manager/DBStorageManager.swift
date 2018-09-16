//
//  DBStoreManager.swift
//  POS
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation
import CoreData

class DBStorageManager {
    
    let persistentContainer: NSPersistentContainer!
    
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    convenience init() {
        self.init(container: CoreDataManager.sharedInstance.persistentContainer)
    }
    
    lazy var backgroundContext: NSManagedObjectContext = {
        return self.persistentContainer.newBackgroundContext()
    }()

    func insertItems(with dictionary:[String:Any]) -> Item? {
        
        guard let item:Item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: backgroundContext) as? Item else {return nil}
        
        item.albumId = dictionary["albumId"] as! Int32
        item.id =  dictionary["id"] as! Int32
        item.title = dictionary["title"] as? String
        item.url = dictionary["url"] as? String
        item.thumbnailUrl = dictionary["thumbnailUrl"] as? String
        
        
        return item
    }
    
    func fetchAllItems() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let results = try? persistentContainer.viewContext.fetch(request)
        return results ?? [Item]()
    }
    
    func remove( objectID: NSManagedObjectID ) {
        let obj = backgroundContext.object(with: objectID)
        backgroundContext.delete(obj)
    }
    
    func save() {
        if backgroundContext.hasChanges {
            do {
                try backgroundContext.save()
            } catch {
                print("Save error \(error)")
            }
        }
    }
}
