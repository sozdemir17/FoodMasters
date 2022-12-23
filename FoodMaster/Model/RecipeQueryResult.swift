//
//  Recipe.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation

struct RecipeQueryResult : Decodable{
    
    var id: Int?
    var title: String?
    var image: String? // Image url
    var imageType: String? // Ex. jpg, png
}


struct QueryResult : Decodable{
    
    var offset: Int?
    var number: Int?
    var results: [RecipeQueryResult]?
    var totalResults: Int?
    
}
