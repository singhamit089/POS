//
//  APIClientTest.swift
//  POSTests
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import XCTest
@testable import POS

class APIClientTest: XCTestCase {

    var apiClient:APIClient!
    var session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        
        apiClient = APIClient(session: session as URLSessionProtocol)
    }
    
    override func tearDown() {
        super.tearDown()
    }
   
    func test_get_request_with_URL() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            fatalError("URL can't be empty")
        }
        
        apiClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(session.lastURL == url)
        
    }
    
    func test_get_resume_called() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            fatalError("URL can't be empty")
        }
        
        apiClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func test_get_should_return_data() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        apiClient.get(url: URL(string: "https://jsonplaceholder.typicode.com/photos")!) { (data, error) in
            actualData = data
        }
        
        XCTAssertNotNil(actualData)
    }
}
