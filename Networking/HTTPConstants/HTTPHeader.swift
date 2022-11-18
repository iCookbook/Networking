//
//  HTTPHeader.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Foundation

/// Type-safe HTTP-header.
public struct HTTPHeader: Hashable {
    
    // MARK: - Public Properties
    
    /// Header's name.
    public let name: String
    /// Value of the header.
    public let value: String
    
    // MARK: - Init
    
    /// Creates instance of HTTP header.
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

// MARK: - CustomStringConvertible

extension HTTPHeader: CustomStringConvertible {
    /// Simplifies the use of this struct by converting it to the following string.
    public var description: String {
        "\(name): \(value)"
    }
}

// MARK: - HTTP headers' wrappers

public extension HTTPHeader {
    static func accept(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept", value: value)
    }
    
    static func acceptCharset(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Charset", value: value)
    }
    
    static func acceptLanguage(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Language", value: value)
    }
    
    static func acceptEncoding(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Encoding", value: value)
    }
    
    static func authorization(username: String, password: String) -> HTTPHeader {
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()
        return authorization("Basic \(credential)")
    }
    
    static func authorization(bearerToken: String) -> HTTPHeader {
        authorization("Bearer \(bearerToken)")
    }
    
    static func authorization(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Authorization", value: value)
    }
    
    static func contentDisposition(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Disposition", value: value)
    }
    
    static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value)
    }
    
    static func contentLength(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Length", value: value)
    }
    
    static func userAgent(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "User-Agent", value: value)
    }
}
