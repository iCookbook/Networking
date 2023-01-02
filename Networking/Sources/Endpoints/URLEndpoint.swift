//
//  URLEndpoint.swift
//  Networking
//
//  Created by Егор Бадмаев on 04.11.2022.
//

/// The main task for endpoint is to provide url
public protocol EndpointProtocol {
    /// Endpoint's url for request.
    var url: URL? { get }
}

/// Endpoint with provided (custom) url.
public struct URLEndpoint: EndpointProtocol {
    /// Custom url.
    let urlString: String
    
    // MARK: - Public Properties
    
    /// Endpoint's url for request.
    public var url: URL? {
        URL(string: urlString)
    }
    
    // MARK: - Init
    
    /// Creates ``URLEndpoint`` instance with provided url (`String`).
    public init(urlString: String) {
        self.urlString = urlString
    }
}
