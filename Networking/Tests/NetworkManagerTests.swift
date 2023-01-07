//
//  NetworkManagerTests.swift
//  Networking-Unit-Tests
//
//  Created by Егор Бадмаев on 07.01.2023.
//

import XCTest
@testable import Networking

class NetworkManagerTests: XCTestCase {
    
    let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
    let defaultDecoder = JSONDecoder()
    /// SUT.
    var networkManager: NetworkManager!
    
    override func setUpWithError() throws {
        networkManager = NetworkManager(session: defaultSession, decoder: defaultDecoder)
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
    }
    
    func testObtainingData() throws {
        let expectation = expectation(description: "Test obtainData method (URLSession asynchronous by default)")
        let requst = NetworkRequest(endpoint: Endpoint.random())
        
        networkManager.obtainData(request: requst) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
