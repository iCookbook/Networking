//
//  APIEndpoints.swift
//  Networking
//
//  Created by Егор Бадмаев on 30.10.2022.
//

import Models

/// Here you can see endpoints for current API - _"Edamam API"_
extension Endpoint {
    public static func random() -> Self {
        return Endpoint(path: "api/recipes/v2",
                        paratemets: ["type": "public",
                                     "app_id": appId,
                                     "app_key": apiKey,
                                     "q": keywords.randomElement() ?? "chichen"]
        )
    }
    
    public static func create(by keyword: String) -> Self {
        return Endpoint(path: "api/recipes/v2",
                        paratemets: ["type": "public",
                                     "app_id": appId,
                                     "app_key": apiKey,
                                     "q": keyword]
        )
    }
    
    public static func create(by keyword: String, with filter: Recipe) -> Self {
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
