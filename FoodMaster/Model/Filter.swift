//
//  Filter.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation
   
extension Int {
    var stringValue:String {
        return "\(self)"
    }
}

struct Filter : Decodable{
    
    var diet: [String]?
    var intolerances: [String]?
    var cuisine: [String]? // Ex. itallian, french
    var excludeCuisine: [String]?
    var type: [String]? // Ex. main course
    
    var minCalories: Int?
    var maxCalories: Int?
    var maxReadyTime: Int?
    
    var sort: String?
    
    func getFilterAsURLParameters(randomFlag: Bool = false) -> String {
        // Put to end of complex query without ampersand
        return "&diet=\(diet?.joined(separator: ",") ?? "")&intolerances=\(intolerances?.joined(separator: ",") ?? "")&cuisine=\(cuisine?.joined(separator: ",") ?? "")&excludeCuisine=\(excludeCuisine?.joined(separator: ",") ?? "")&type=\(type?.joined(separator: ",") ?? "")&minCalories=\(minCalories?.stringValue ?? "")&maxCalories=\(maxCalories?.stringValue ?? "")&maxReadyTime=\(maxReadyTime?.stringValue ?? "")&sort=\((randomFlag ? "random" : sort) ?? "")"
    }
    
}
