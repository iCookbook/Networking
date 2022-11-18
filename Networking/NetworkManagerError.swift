//
//  NetworkManagerError.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

/// Custom errors for ``NetworkManager``.
public enum NetworkManagerError: Error {
    /// Invalid URL.
    case invalidURL
    /// Retain cycle occured.
    case retainCycle
    /// Some network error that is specified in the passed argument with conforming to `Error` protocol.
    case networkError(Error)
    /// Error on parsing JSON with decoder.
    case parsingJSONError
}
