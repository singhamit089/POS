//
//  MockComponentsDBStorageManager.swift
//  POSTests
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation
import CoreData

@testable import POS

extension DBStorageManagerTest {
    
    func initStubs() {
        
        func insertItems( dict:[String:Any]) -> Item {
            
            let obj = NSEntityDescription.insertNewObject(forEntityName: "Item", into: mockPersistantContainer.viewContext)
            
            obj.setValuesForKeys(dict)
            
            return (obj as? Item)!
        }
        
        _ = insertItems(dict: [
            "albumId": 1,
            "id": 1,
            "price": 100.0,
            "title": "accusamus beatae ad facilis cum similique qui sunt",
            "url": "https://via.placeholder.com/600/92c952",
            "thumbnailUrl": "https://via.placeholder.com/150/92c952"
            ])
        
        _ = insertItems(dict: [
            "albumId": 1,
            "id": 2,
            "price": 100.0,
            "title": "reprehenderit est deserunt velit ipsam",
            "url": "https://via.placeholder.com/600/771796",
            "thumbnailUrl": "https://via.placeholder.com/150/771796"
            ])
        
        _ = insertItems(dict: [
            "albumId": 1,
            "id": 3,
            "price": 100.0,
            "title": "officia porro iure quia iusto qui ipsa ut modi",
            "url": "https://via.placeholder.com/600/24f355",
            "thumbnailUrl": "https://via.placeholder.com/150/24f355"
            ])
        
        _ = insertItems(dict: [
            "albumId": 1,
            "id": 4,
            "price": 100.0,
            "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
            "url": "https://via.placeholder.com/600/d32776",
            "thumbnailUrl": "https://via.placeholder.com/150/d32776"
            ])
        
        _ = insertItems(dict: [
            "albumId": 1,
            "id": 5,
            "price": 100.0,
            "title": "natus nisi omnis corporis facere molestiae rerum in",
            "url": "https://via.placeholder.com/600/f66b97",
            "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
            ])
        
        do {
            try mockPersistantContainer.viewContext.save()
        }  catch {
            print("create fakes error \(error)")
        }
    }
    
    func flushData() {
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let objs = try! mockPersistantContainer.viewContext.fetch(fetchRequest)
        for case let obj as NSManagedObject in objs {
            mockPersistantContainer.viewContext.delete(obj)
        }
        
        try! mockPersistantContainer.viewContext.save()
        
    }
    
    func numberOfItemsInPersistentStore() -> Int {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        let results = try! mockPersistantContainer.viewContext.fetch(request)
        return results.count
    }
    
    
}
