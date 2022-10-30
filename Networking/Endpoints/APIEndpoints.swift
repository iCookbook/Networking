//
//  APIEndpoints.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

/// Here you can see endpoints for current API - _"Edamam API"_
extension Endpoint {
    public static func mostactive() -> Self {
        return Endpoint(path: "stable/stock/market/list/mostactive",
                        paratemets: ["token": apiKey]
        )
    }
}
