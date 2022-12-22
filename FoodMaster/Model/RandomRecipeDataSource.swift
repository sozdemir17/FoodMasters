//
//  RandomRecipeDataSource.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation


class RandomRecipeDataSource: RecipeDataSource {
    
    
    private let reloadListLowerLimit: Int = 10
    private let numberOfRecipesToLoad: Int = 20
    
    func loadRandomRecipes(appendFlag: Bool = false) {
        
        super.queryRecipeByFilter(query: "")
    }
    
    func getRandomRecipe(){
        
    }
}
