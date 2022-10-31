//
//  NetworkManager.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Foundation

public protocol NetworkManagerProtocol {
    /// Defined to allow the using object to change the session configuration
    var session: URLSession { get set }
    /// Main method to perform getting data
    func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void)
}

/// Class responsible for networking.
public final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Public Properties
    
    /// API for networking. It is public for making this property editable from the outside.
    public var session: URLSession
    
    // MARK: - Private Properties
    
    /// An object that decodes instances of a data type from JSON objects
    private let decoder: JSONDecoder
    
    // MARK: - Init
    
    public init(session: URLSession, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    // MARK: - Public Methods
    
    /// Performs getting data from the Internet and then decoding it with provided generic-type.
    /// - Parameters:
    ///   - request: instance of ``NetworkRequest`` that has endpoint and type-safe HTTP-method and -headers for a request.
    ///   - completion: completion handler that has `Result` enum with `Model` (success) and ``NetworkManagerError`` (failure) paratemets.
    public func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void) {
        
        guard let url = request.endpoint.url else {
            completion(.failure(NetworkManagerError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: request.timeoutInterval)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.httpHeaderFields.reduce(into: [String: String](), { partialResult, header in
            partialResult[header.name, default: ""] = header.value
        })
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            
            /// We use the capture list in order to avoid reference-cycle or/and application crashes.
            /// `[weak self]` - creating a **weak** reference to `self`, thereby avoiding reference-cycle/crash
            /// Then we create a `strongSelf` - a strong reference to `self` inside the block, so we guarantee that the block will be executed to the end, since the instance of the class will not be able to reset, and we also avoid problems with optionals
            guard let strongSelf = self else {
                completion(.failure(NetworkManagerError.retainCycle))
                return
            }
            
            guard error == nil, let data = data else {
                completion(.failure(NetworkManagerError.networkError(error!))) // we are sure error != nil
                return
            }
            
            guard let model = try? strongSelf.decoder.decode(Model.self, from: data) else {
                completion(.failure(NetworkManagerError.parsingJSONError))
                return
            }
            
            completion(.success(model.self))
        })
        dataTask.resume()
    }
}

