//
//  NetworkManagerError.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

public enum NetworkManagerError: Error {
    case invalidURL
    case retainCycle
    case networkError(Error)
    case parsingJSONError
}
