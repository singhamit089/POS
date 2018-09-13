//
//  APIService.swift
//  POS
//
//  Created by Amit  Singh on 9/14/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

class APIService: NSObject {
    
    let query = ""
    lazy var endPoint:String = { return "https://jsonplaceholder.typicode.com/photos" }()
    
    func getDataWith(completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        guard let url = URL(string: endPoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    DispatchQueue.main.async {
                        completion(.Success(json))
                    }
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
}

enum Result <T>{
    case Success(T)
    case Error(String)
}
