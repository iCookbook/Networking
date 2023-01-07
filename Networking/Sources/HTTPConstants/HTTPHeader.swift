//
//  HTTPHeader.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

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
    /// Creates "Accept" header instance.
    static func accept(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept", value: value)
    }
    
    /// Creates "Accept-Charset" header instance.
    static func acceptCharset(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Charset", value: value)
    }
    
    /// Creates "Accept-Language" header instance.
    static func acceptLanguage(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Language", value: value)
    }
    
    /// Creates "Accept-Encoding" header instance.
    static func acceptEncoding(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Accept-Encoding", value: value)
    }
    
    /// Creates "Basic [credentials]" header instance.
    static func authorization(username: String, password: String) -> HTTPHeader {
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()
        return authorization("Basic \(credential)")
    }
    
    /// Creates "Bearer [token]" header instance.
    static func authorization(bearerToken: String) -> HTTPHeader {
        authorization("Bearer \(bearerToken)")
    }
    
    /// Creates "Authorization" header instance.
    static func authorization(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Authorization", value: value)
    }
    
    /// Creates "Content-Disposition" header instance.
    static func contentDisposition(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Disposition", value: value)
    }
    
    /// Creates "Content-Type" header instance.
    static func contentType(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Type", value: value)
    }
    
    /// Creates "Content-Length" header instance.
    static func contentLength(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "Content-Length", value: value)
    }
    
    /// Creates "User-Agent" header instance.
    static func userAgent(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "User-Agent", value: value)
    }
}
