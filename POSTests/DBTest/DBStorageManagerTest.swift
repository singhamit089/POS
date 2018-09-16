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
        
        initStubs()
        
        sut =  DBStorageManager(container: mockPersistantContainer)
        
        //Listen to the change in context
        NotificationCenter.default.addObserver(self, selector: #selector(contextSaved(notification:)), name: NSNotification.Name.NSManagedObjectContextDidSave , object: nil)
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
    
    func test_fetch_all_item() {
        
        //Given a storage with two todo
        
        //When fetch
        let results = sut.fetchAllItems()
        
        //Assert return two todo items
        XCTAssertEqual(results.count, 5)
    }
    
    func test_remove_item() {
        
        //Given a item in persistent store
        let items = sut.fetchAllItems()
        let item = items[0]
        
        let numberOfItems = items.count
        
        //When remove a item
        sut.remove(objectID: item.objectID)
        sut.save()
        
        //Assert number of item - 1
        XCTAssertEqual(numberOfItemsInPersistentStore(), numberOfItems-1)
        
    }
    
    func test_save() {
        
        //Give a todo item
        
        let newItem = ["albumId": 1,
                       "id": 6,
                       "price": 100.0,
                       "title": "accusamus ea aliquid et amet sequi nemo",
                       "url": "https://via.placeholder.com/600/56a8c2",
                       "thumbnailUrl": "https://via.placeholder.com/150/56a8c2" ] as [String : Any]
        
        _ = expectationForSaveNotification()
        
        _ = sut.insertItems(with: newItem)
        
        //When save
        //Assert save is called via notification (wait)
        expectation(forNotification: NSNotification.Name(rawValue: Notification.Name.NSManagedObjectContextDidSave.rawValue), object: nil, handler: nil)
        
        sut.save()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    //MARK: Convinient function for notification
    var saveNotificationCompleteHandler: ((Notification)->())?
    
    func expectationForSaveNotification() -> XCTestExpectation {
        let expect = expectation(description: "Context Saved")
        waitForSavedNotification { (notification) in
            expect.fulfill()
        }
        return expect
    }
    
    func waitForSavedNotification(completeHandler: @escaping ((Notification)->()) ) {
        saveNotificationCompleteHandler = completeHandler
    }
    
    func contextSaved( notification: Notification ) {
        print("\(notification)")
        saveNotificationCompleteHandler?(notification)
    }
}
