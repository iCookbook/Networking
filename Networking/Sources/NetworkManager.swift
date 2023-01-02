//
//  NetworkManager.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

/// Abstraction over any network manager.
public protocol NetworkManagerProtocol {
    /// Performs getting data from the Internet and then decoding it with provided generic-type.
    ///
    /// - Parameters:
    ///   - request: contains all required information for the request.
    ///   - completion: completion handler that has `Result` enum with generic `Model` (success) and ``NetworkManagerError`` (failure) paratemets.
    func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void)
    
    /// Gets `Data` from the server.
    ///
    /// - Parameters:
    ///   - urlString: link to the source of data.
    ///   - completion: completion handler with `Result` enum.
    func obtainData(request: NetworkRequest, completion: @escaping (Result<Data, NetworkManagerError>) -> Void)
}

/// An object responsible for networking.
public final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Private Properties
    
    /// Decodes instances of a data type from JSON objects.
    private let decoder: JSONDecoder
    /// Coordinates a group of related, network data transfer tasks.
    private let session: URLSession
    
    // MARK: - Init
    
    /// Creates a network manager with the specified `URLSession` and optional `JSONDecoder`.
    public init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    /// Performs getting data from the Internet and then decoding it with provided generic-type.
    ///
    /// - Parameters:
    ///   - request: contains all required information for the request.
    ///   - completion: completion handler with `Result` enum.
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
            /// `[weak self]` - creating a **weak** reference to `self`, thereby avoiding reference-cycle/crash.
            /// Then we create a `strongSelf` - a strong reference to `self` inside the block, so we guarantee
            /// the block will be executed to the end, since the instance of the class will not be able to reset, and we also avoid problems with optionals.
            guard let strongSelf = self else {
                completion(.failure(.retainCycle))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  let statusCode = HTTPStatusCode(rawValue: response.statusCode)
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard statusCode.isSuccessful else {
                completion(.failure(.unsuccessfulStatusCode(statusCode)))
                return
            }
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data,
                  let model = try? strongSelf.decoder.decode(Model.self, from: data)
            else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(model.self))
        })
        dataTask.resume()
    }
    
    /// Gets `Data` from the server.
    ///
    /// - Parameters:
    ///   - urlString: link to the source of data.
    ///   - completion: completion handler with `Result` enum.
    public func obtainData(request: NetworkRequest, completion: @escaping (Result<Data, NetworkManagerError>) -> Void) {
        
        guard let url = request.endpoint.url else {
            completion(.failure(NetworkManagerError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: request.timeoutInterval)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.httpHeaderFields.reduce(into: [String: String](), { partialResult, header in
            partialResult[header.name, default: ""] = header.value
        })
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            completion(.success(data))
        })
        dataTask.resume()
    }
}
