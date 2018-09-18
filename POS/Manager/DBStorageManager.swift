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
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Item.self))

        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
    }()

    func insertItems(with dictionary:[String:Any]) -> Item? {
        
        guard let item:Item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: backgroundContext) as? Item else {return nil}
        
        item.albumId = Int32(dictionary["albumId"] as! Int)
        item.id =  Int32(dictionary["id"] as! Int)
        item.title = dictionary["title"] as? String
        item.url = dictionary["url"] as? String
        item.thumbnailUrl = dictionary["thumbnailUrl"] as? String
        
        if let price = dictionary["price"]{
            item.price = price as! Double
        }else{
            item.price = Double(0)
        }
        
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
    
    func insertitemArrayInBatches(with array:Array<[String:Any]>) {
        
        let managedObjectContext =  NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        
        managedObjectContext.perform { // runs asynchronously
            
            autoreleasepool {
                array.chunked(by: 1000).map({ (subArray) in
                    subArray.map({ (dictionary) -> Item in
                        
                        let item:Item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
                        
                        item.albumId = Int32(dictionary["albumId"] as! Int)
                        item.id =  Int32(dictionary["id"] as! Int)
                        item.title = dictionary["title"] as? String
                        item.url = dictionary["url"] as? String
                        item.thumbnailUrl = dictionary["thumbnailUrl"] as? String
                        item.price = dictionary["price"] as! Double
                        return item
                    })
                })
            }
            
            // only save once per batch insert
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
            
            managedObjectContext.reset()
            }
        }
    
    func deleteAllObjectsForEnity(entity:Any) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: entity))
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try self.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: self.backgroundContext)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}
