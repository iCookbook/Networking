//
//  Endpoint.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Foundation

/// An endpoint is an access to a route by a separate HTTP method. The endpoint performs a specific task, accepts parameters and returns data to the client.
public struct Endpoint: EndpointProtocol {
    /// Path to an endpoint.
    let path: String
    /// Parameters for an endpoint.
    var parameters = [(String, String)]()
    
    // MARK: - Public Properties
    
    /// Property that computes the `url` of the instance.
    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.edamam.com"
        components.path = "/" + path
        components.queryItems = parameters.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components.url
    }
    
    // MARK: - Static Properties
    
    /// Keywords for randomize search results. Quote `q` is required for Edamam API, so this property is being used to randomize getting data.
    static let keywords = ["chicken", "beef", "mushroom", "cheese", "pepperoni", "pepper", "garlic", "basil", "onion", "salami", "bacon", "shrimps", "fish", "anchovies", "pepper", "olives", "meat", "veal", "lamb", "meatballs", "turkey", "apple", "pizza", "pasta", "potato", "tomato", "milk", "burger", "cucumber", "soup", "cake", "pumpkin", "sandwich", "hamburger"]
}
