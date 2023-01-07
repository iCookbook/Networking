//
//  HTTPHeaderTests.swift
//  Networking-Unit-Tests
//
//  Created by Егор Бадмаев on 07.01.2023.
//

import XCTest
@testable import Networking

class HTTPHeaderTests: XCTestCase {
    
    let value = "value"
    var header: HTTPHeader!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        header = nil
    }
    
    func testAccept() throws {
        header = HTTPHeader.accept(value)
        
        XCTAssertEqual(header.name, "Accept")
        XCTAssertEqual(header.value, value)
    }
    
    func testAcceptCharset() throws {
        header = HTTPHeader.acceptCharset(value)
        
        XCTAssertEqual(header.name, "Accept-Charset")
        XCTAssertEqual(header.value, value)
    }
    
    func testAcceptLanguage() throws {
        header = HTTPHeader.acceptLanguage(value)
        
        XCTAssertEqual(header.name, "Accept-Language")
        XCTAssertEqual(header.value, value)
    }
    
    func testAcceptEncoding() throws {
        header = HTTPHeader.acceptEncoding(value)
        
        XCTAssertEqual(header.name, "Accept-Encoding")
        XCTAssertEqual(header.value, value)
    }
    
    func testAuthorizationWithLoginAndPassword() throws {
        let username = "username"
        let password = "password"
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()
        
        header = HTTPHeader.authorization(username: username, password: password)
        
        XCTAssertEqual(header.name, "Authorization")
        XCTAssertEqual(header.value, HTTPHeader.authorization("Basic \(credential)").value)
    }
    
    func testAuthorizationWithBearerToken() throws {
        let token = "token"
        
        header = HTTPHeader.authorization(bearerToken: token)
        
        XCTAssertEqual(header.name, "Authorization")
        XCTAssertEqual(header.value, "Bearer \(token)")
    }
    
    func testAuthorization() throws {
        header = HTTPHeader.authorization(value)
        
        XCTAssertEqual(header.name, "Authorization")
        XCTAssertEqual(header.value, value)
    }
    
    func testContentType() throws {
        header = HTTPHeader.contentType(value)
        
        XCTAssertEqual(header.name, "Content-Type")
        XCTAssertEqual(header.value, value)
    }
    
    func testContentLength() throws {
        header = HTTPHeader.contentLength(value)
        
        XCTAssertEqual(header.name, "Content-Length")
        XCTAssertEqual(header.value, value)
    }
    
    func testContentDisposition() throws {
        header = HTTPHeader.contentDisposition(value)
        
        XCTAssertEqual(header.name, "Content-Disposition")
        XCTAssertEqual(header.value, value)
    }
    
    func testUserAgent() throws {
        header = HTTPHeader.userAgent(value)
        
        XCTAssertEqual(header.name, "User-Agent")
        XCTAssertEqual(header.value, value)
    }
}
