//
//  NetworkRequest.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Foundation

/// Defines network request.
public struct NetworkRequest {
    /// Endpoint for request.
    let endpoint: EndpointProtocol
    /// Type-safe HTTP method.
    let method: HTTPMethod
    /// Type-safe HTTP headers.
    let httpHeaderFields: [HTTPHeader]
    /// The timeout interval of the request.
    let timeoutInterval: TimeInterval
    
    // MARK: - Init
    
    /// Memberwise initializer for `NetworkRequests` that creates its' instance.
    public init(endpoint: EndpointProtocol, method: HTTPMethod = .get, httpHeaderFields: [HTTPHeader] = [], timeoutInterval: TimeInterval = 5) {
        self.endpoint = endpoint
        self.method = method
        self.httpHeaderFields = httpHeaderFields
        self.timeoutInterval = timeoutInterval
    }
}
