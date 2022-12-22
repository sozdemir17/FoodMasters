//
//  RecipeDetail.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation

struct RecipeDetail : Decodable{
    var id: Int?
    var title: String?
    var image: String? // image url
    var imageType: String?
    var servings: Int?
    var readyInMinutes: Int?
    var healthScore: Double?
    var spoonacularScore: Double?
    var pricePerServing: Double?
    var creditsText: String?
    var dishTypes: [String]?
    var summary: String?
    var extendedIngredients: [Ingredient]
}
