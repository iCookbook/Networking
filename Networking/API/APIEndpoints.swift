//
//  APIEndpoints.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Foundation

/// Here you can see endpoints for current API - _"Edamam API"_.
public extension Endpoint {
    /// Endpoint for 20 random recipes.
    ///
    /// - Returns: ``Endpoint`` instance.
    ///
    /// - Note: Random is done on random choosing keyword that is required for this API and `random` from this API.
    static func random() -> Self {
        return Endpoint(path: "api/recipes/v2",
                        parameters: ["type": "public",
                                     "app_id": Credentials.appId,
                                     "app_key": Credentials.apiKey,
                                     "q": keywords.randomElement() ?? "chicken"]
        )
    }
    
    /// Endpoint for 20 random recipes by provided `Cuisine`.
    ///
    /// - Parameter category: cuisine to concrete random.
    /// - Returns: ``Endpoint`` instance.
    ///
    /// - Note: Random is done on random choosing keyword that is required for this API and `random` from this API.
    static func random(by category: String) -> Self {
        return Endpoint(path: "api/recipes/v2",
                        parameters: ["type": "public",
                                     "app_id": Credentials.appId,
                                     "app_key": Credentials.apiKey,
                                     "cuisineType": category,
                                     "q": keywords.randomElement() ?? "chicken"]
        )
    }
    
    /// Creates endpoint with provided keyword and optional filters.
    ///
    /// - Parameters:
    ///   - keyword: keyword to find (required)
    ///   - meals: meal types
    ///   - diets: diet types
    ///   - cuisines: world cuisines
    ///   - dishes: dish types
    ///   
    /// - Returns: ``Endpoint`` instance
    static func create(by keyword: String, meals: String?, diets: String?, cuisines: String?, dishes: String?) -> Self {
        var parameters = ["type": "public",
                          "app_id": Credentials.appId,
                          "app_key": Credentials.apiKey,
                          "q": keyword]
        
        parameters["mealType"] = meals
        parameters["diet"] = diets
        parameters["cuisineType"] = cuisines
        parameters["dishType"] = dishes
        
        return Endpoint(path: "api/recipes/v2",
                        parameters: parameters)
    }
}
