//
//  HTTPMethod.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

/// Type-safe HTTP-method.
///
/// All methods are self-describing.
public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
