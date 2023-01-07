//
//  URLEndpointTests.swift
//  Networking-Unit-Tests
//
//  Created by Егор Бадмаев on 07.01.2023.
//

import XCTest
@testable import Networking

class URLEndpointTests: XCTestCase {
    
    var endpoint: URLEndpoint!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        endpoint = nil
    }
    
    func testEndpointWithEmptyString() throws {
        endpoint = URLEndpoint(urlString: "")
        
        XCTAssertTrue(endpoint.urlString.isEmpty)
        XCTAssertNil(endpoint.url)
    }
    
    func testEndpointWithPath() throws {
        endpoint = URLEndpoint(urlString: "path")
        
        XCTAssertFalse(endpoint.urlString.isEmpty)
        XCTAssertNotNil(endpoint.url)
    }
}
