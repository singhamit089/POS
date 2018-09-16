//
//  DataProvider.swift
//  POS
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

enum Result <T>{
    case Success(Bool)
    case Error(Error)
}

class DataProvider {
    
    var apiClient = APIClient(session: URLSession.shared)
    
    /**
     Makes API Call to get the list of all Items
     */
    func getProductList(completion: @escaping (Result<Any>)->Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            fatalError("URL Can't be nil")
        }
        
        apiClient.get(url: url) { (data, error) in
            
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    
                    DispatchQueue.main.async {
                        
                    }
                }
            } catch let error {
                return completion(.Error(error))
            }
        }
    }
}