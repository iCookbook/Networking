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
    var endpoint: Endpoint
    /// Type-safe HTTP method.
    var method: HTTPMethod = .get
    /// Type-safe HTTP headers.
    var httpHeaderFields: [HTTPHeader] = []
    /// The timeout interval of the request.
    var timeoutInterval: TimeInterval = 5
    
    // MARK: - Init
    
    public init(endpoint: Endpoint, method: HTTPMethod = .get, httpHeaderFields: [HTTPHeader] = [], timeoutInterval: TimeInterval = 3) {
        self.endpoint = endpoint
        self.method = method
        self.httpHeaderFields = httpHeaderFields
        self.timeoutInterval = timeoutInterval
    }
}
