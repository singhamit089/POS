//
//  APIService.swift
//  POS
//
//  Created by Amit  Singh on 9/14/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

class APIClient {
    
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func get( url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
}

protocol URLSessionProtocol {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    
    func dataTask(with:URLRequest, completionHandler: DataTaskResult) -> URLSessionProtocol
}

extension URLSessionProtocol {
    func resume() {
    }
}
