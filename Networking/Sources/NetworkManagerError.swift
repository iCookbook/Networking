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
    /// Invalid response got from the server.
    case invalidResponse
    /// Unsuccessful response status code.
    case unsuccessfulStatusCode(HTTPStatusCode)
    /// Some network error that is specified in the passed argument with conforming to `Error` protocol.
    case networkError(Error)
    /// Error on parsing JSON with decoder.
    case decodingError
}

extension NetworkManagerError: Equatable {
    
    public static func == (lhs: NetworkManagerError, rhs: NetworkManagerError) -> Bool {
        switch (lhs, rhs) {
        case (let .unsuccessfulStatusCode(lhsCode), let .unsuccessfulStatusCode(rhsCode)):
            return lhsCode.rawValue == rhsCode.rawValue
        case (let .networkError(lhsError), let .networkError(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return lhs.localizedDescription == rhs.localizedDescription
        }
    }
}
