//
//  APIRequests.swift
//  Networking
//
//  Created by Егор Бадмаев on 04.11.2022.
//

import Models

/// Wrappers over requests for ``NetworkManager``
public extension NetworkManager {
    /// Provides ``Reponse`` from the server.
    /// - Parameters:
    ///   - request: ``NetworkRequest`` instance with all info about the request.
    ///   - completion: completion handler with `Result` enum.
    func getResponse(request: NetworkRequest, completion: @escaping (Result<Response, NetworkManagerError>) -> Void) {
        perform(request: request, completion: completion)
    }
}
