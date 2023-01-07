//
//  NetworkRequestTests.swift
//  Networking-Unit-Tests
//
//  Created by Егор Бадмаев on 07.01.2023.
//

import XCTest
@testable import Networking

class NetworkRequestTests: XCTestCase {
    
    let mockEndpoint = Endpoint(path: "test")
    /// SUT.
    var networkRequest: NetworkRequest!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        networkRequest = nil
    }
    
    func test_InitializingNetworkRequest_withoutAdditionalData() throws {
        XCTAssertNoThrow(
            networkRequest = NetworkRequest(endpoint: mockEndpoint)
        )
    }
    
    func test_InitializingNetworkRequest_withAdditionalData() throws {
        let method = HTTPMethod.get
        let httpHeaderFields = [HTTPHeader.accept("value"), HTTPHeader.authorization("value")]
        let timeoutInterval: TimeInterval = 0
        
        networkRequest = NetworkRequest(endpoint: mockEndpoint,
                                        method: method,
                                        httpHeaderFields: httpHeaderFields,
                                        timeoutInterval: timeoutInterval
        )
        
        XCTAssertEqual(networkRequest.endpoint.url, mockEndpoint.url)
        XCTAssertEqual(networkRequest.method, method)
        XCTAssertEqual(networkRequest.httpHeaderFields, httpHeaderFields)
        XCTAssertEqual(networkRequest.timeoutInterval, timeoutInterval)
    }
}
