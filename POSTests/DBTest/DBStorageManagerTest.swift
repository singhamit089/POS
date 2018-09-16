//
//  DBStorageManagerTest.swift
//  POSTests
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import XCTest
import CoreData

@testable import POS

class DBStorageManagerTest: XCTestCase {
    
    var sut:DBStorageManager!
    
    //MARK: mock in-memory persistant store
    lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: nil )!
        return managedObjectModel
    }()
    
    lazy var mockPersistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "POS", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    override func setUp() {
        super.setUp()
        
        sut =  DBStorageManager(container: mockPersistantContainer)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_create_item() {
        
        let newItem = ["albumId": 1,
                       "id": 6,
                       "price": 100.0,
                       "title": "accusamus ea aliquid et amet sequi nemo",
                       "url": "https://via.placeholder.com/600/56a8c2",
                       "thumbnailUrl": "https://via.placeholder.com/150/56a8c2" ] as [String : Any]
        
    
        let itemObject = sut.insertItems(with: newItem)
        
        //Assert: return item
        XCTAssertNotNil( itemObject )
        
    }
}
