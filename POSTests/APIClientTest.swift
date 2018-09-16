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
}
