//
//  EndpointTests.swift
//  Networking-Unit-Tests
//
//  Created by Егор Бадмаев on 07.01.2023.
//

import XCTest
@testable import Networking

class EndpointTests: XCTestCase {
    
    var endpoint: Endpoint!
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        endpoint = nil
    }
    
    func testRandomDataEndpoint() throws {
        XCTAssertNoThrow(
            endpoint = Endpoint.random()
        )
    }
    
    func testRandomDataByCuisineEndpoint() throws {
        let cuisine = "italian"
        
        endpoint = Endpoint.random(by: cuisine)
        
        XCTAssertTrue(endpoint.url!.absoluteString.contains("cuisineType=\(cuisine)"))
    }
    
    func test_dataByKeywordEndpoint_onlyMeals() throws {
        let keyword = "Chicken"
        let meals = [("mealType", "breakfast"), ("mealType", "lunch/dinner"), ("mealType", "teatime")]
        
        endpoint = Endpoint.create(by: keyword, meals: meals, diets: [(String, String)](), cuisines: [(String, String)](), dishes: [(String, String)]())
        
        XCTAssertEqual(endpoint.url, URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=d6544fa1&app_key=46ffea991d22cd980b515e373b4b852a&q=Chicken&mealType=breakfast&mealType=lunch/dinner&mealType=teatime"))
    }
    
    func test_dataByKeywordEndpoint_onlyDiets() throws {
        let keyword = "Chicken"
        let diets = [("diet", "Balanced"), ("diet", "High-Fiber"), ("diet", "High-Protein")]
        
        endpoint = Endpoint.create(by: keyword, meals: [(String, String)](), diets: diets, cuisines: [(String, String)](), dishes: [(String, String)]())
        
        XCTAssertEqual(endpoint.url, URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=d6544fa1&app_key=46ffea991d22cd980b515e373b4b852a&q=Chicken&diet=Balanced&diet=High-Fiber&diet=High-Protein"))
    }
    
    func test_dataByKeywordEndpoint_onlyCuisines() throws {
        let keyword = "Chicken"
        let cuisines = [("cuisineType", "british"), ("cuisineType", "italian"), ("cuisineType", "japanese")]
        
        endpoint = Endpoint.create(by: keyword, meals: [(String, String)](), diets: [(String, String)](), cuisines: cuisines, dishes: [(String, String)]())
        
        XCTAssertEqual(endpoint.url, URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=d6544fa1&app_key=46ffea991d22cd980b515e373b4b852a&q=Chicken&cuisineType=british&cuisineType=italian&cuisineType=japanese"))
    }
    
    func test_dataByKeywordEndpoint_onlyDishes() throws {
        let keyword = "Chicken"
        let dishes = [("dishType", "biscuits and cookies"), ("dishType", "bread"), ("dishType", "alcohol cocktail")]
        
        endpoint = Endpoint.create(by: keyword, meals: [(String, String)](), diets: [(String, String)](), cuisines: [(String, String)](), dishes: dishes)
        
        XCTAssertEqual(endpoint.url, URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=d6544fa1&app_key=46ffea991d22cd980b515e373b4b852a&q=Chicken&dishType=biscuits%20and%20cookies&dishType=bread&dishType=alcohol%20cocktail"))
    }
}
