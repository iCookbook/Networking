//
//  APIEndpoints.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Models

/// Here you can see endpoints for current API - _"Edamam API"_
extension Endpoint {
    /// Endpoint for 20 random recipes.
    /// Random is done on random choosing keyword that is required for this API. So, it is not impossible to get true random recipes.
    /// - Returns: `Endpoint` instance
    public static func random() -> Self {
        return Endpoint(path: "api/recipes/v2",
                        paratemets: ["type": "public",
                                     "app_id": appId,
                                     "app_key": apiKey,
                                     "q": keywords.randomElement() ?? "chichen"]
        )
    }
    
    /// Creates endpoint with provided keyword
    /// - Parameter keyword: keyword to find (required)
    /// - Returns: `Endpoint` instance
    public static func create(by keyword: String) -> Self {
        return Endpoint(path: "api/recipes/v2",
                        paratemets: ["type": "public",
                                     "app_id": appId,
                                     "app_key": apiKey,
                                     "q": keyword]
        )
    }
    
    /// Creates endpoint with provided keyword and **filters**
    /// - Parameters:
    ///   - keyword: keyword to find (required)
    ///   - meals: meal types
    ///   - diets: diet types
    ///   - cuisines: world cuisines
    ///   - dishes: dish types
    /// - Returns: `Endpoint` instance
    public static func create(by keyword: String, meals: [Meal] = [], diets: [Diet] = [], cuisines: [Cuisine] = [], dishes: [Dish] = []) -> Self {
        return Endpoint(path: "api/recipes/v2",
                        paratemets: ["type": "public",
                                     "app_id": appId,
                                     "app_key": apiKey,
                                     "q": keyword,
                                     "diet": "high-fiber",
                                     "cuisineType": "American",
                                     "mealType": "Dinner",
                                     "dishType": "Biscuits%20and%20cookies"]
        )
    }
}
