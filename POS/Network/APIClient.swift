//
//  APIService.swift
//  POS
//
//  Created by Amit  Singh on 9/14/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import Foundation

class APIClient {
    typealias completeClosure = (_ data: Data?, _ error: Error?) -> Void

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol) {
        self.session = session
    }

    func get(url: URL, callback: @escaping completeClosure) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, _, error in
            callback(data, error)
        }
        task.resume()
    }
}

typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let task: URLSessionDataTask = dataTask(with: request, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in completionHandler(data, response, error) }) as URLSessionDataTask
        return task
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
