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
    var paratemets: [String: String] = [:]
    
    // MARK: - Public Properties
    
    /// Property that computes the `url` of the instance.
    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.edamam.com"
        components.path = "/" + path
        components.queryItems = paratemets.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }
    
    // MARK: - Static Properties
    
    /// Application ID of the API.
    static let appId = "d6544fa1"
    /// API key/token.
    static let apiKey = "46ffea991d22cd980b515e373b4b852a"
    /// Keywords for randomize search results. Quote `q` is required for Edamam API, so this property is being used to randomize getting data.
    static let keywords = ["chicken", "beef", "mushroom", "cheese", "pepperoni", "pepper", "garlic", "basil", "onion", "salami", "bacon", "shrimps", "fish", "anchovies", "pepper", "olives", "meat", "veal", "lamb", "meatballs", "turkey", "apple", "pizza", "pasta", "potato", "tomato", "milk", "burger", "cucumber", "soup", "cake", "pumpkin", "sandwich", "hamburger"]
}
