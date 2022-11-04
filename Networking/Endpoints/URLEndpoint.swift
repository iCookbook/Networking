//
//  URLEndpoint.swift
//  Networking
//
//  Created by Егор Бадмаев on 04.11.2022.
//

public protocol EndpointProtocol {
    var url: URL? { get }
}

public struct URLEndpoint: EndpointProtocol {
    let urlString: String
    
    public var url: URL? {
        URL(string: urlString)
    }
}
