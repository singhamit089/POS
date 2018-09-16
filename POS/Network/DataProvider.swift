//
//  DataProvider.swift
//  POS
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

enum Result <T>{
    case Success(T)
    case Error(Error)
}

class DataProvider {
    
    static let sharedInstance = DataProvider()
    
    private init() {}
    
    var apiClient = APIClient(session: URLSession.shared)
    
    var storageManager = DBStorageManager(container: CoreDataManager.sharedInstance.persistentContainer)
    
    /**
     Makes API Call to get the list of all Items
     */
    func getProductList(completion: @escaping (Result<Bool>)->Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            fatalError("URL Can't be nil")
        }
        
        apiClient.get(url: url) { (data, error) in
            
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    
                    _ = jsonArray.map({ objectDict -> ([String : AnyObject]) in
                        let item = self.storageManager.insertItems(with: objectDict)
                        let price = Double(arc4random_uniform(100) * UInt32(objectDict["id"] as! Int))
                        item?.price = price
                        return objectDict
                    })
                    
                    self.storageManager.save()
                    
                    DispatchQueue.main.async {
                        
                        /* ****
                         TODO : To be removed later
                         Printing the path for sqlite file only for Debug purpose
                         */
                        CoreDataManager.sharedInstance.applicationDocumentsDirectory()
                        completion(.Success(true))
                    }
                }
            } catch let error {
                return completion(.Error(error))
            }
        }
    }
}
