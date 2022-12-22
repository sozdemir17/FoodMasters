//
//  Ingredient.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation


struct Ingredient : Decodable{
    
    var name: String?
    var original: String? // original description, can be used directly
    var aisle: String? // General type
    var amount: Double?
    var id: Int?
    var measures: Measure?
    
    
}


struct Measure : Decodable{
    var metric: MeasureItem?
    var us: MeasureItem?
}

struct MeasureItem : Decodable{
    
    var amount: Double?
    var unitLong: String?
    var unitShort: String?
    
}
