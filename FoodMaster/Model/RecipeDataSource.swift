//
//  RecipeDataSource.swift
//  FoodMaster
//
//  Created by User on 22.12.2022.
//

import Foundation


class RecipeDataSource {
    
    private let apiKey: String = "6dfaeb8ead354c61b8ae4a8ab985e831"
    private let baseURL: String = "https://api.spoonacular.com"
    private var defaultFilter : Filter?
    var delegate: DataLoadedDelegate?
    
    var recipe: RecipeDetail?
    var queryResults: [RecipeDetail]?
    
    
    // example: https://api.spoonacular.com/recipes/716429/information?apiKey=YOUR-API-KEY&includeNutrition=true
    init() {
    }
    
    
    func queryRecipeByFilter(query: String, filter: Filter? = nil, appendFlag: Bool = false, numberOfResults: Int = 20) {
        var recipeQueryResults: QueryResult?
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/recipes/complexSearch/information?apiKey=\(apiKey)&number=\(numberOfResults)\(filter?.getFilterAsURLParameters() ?? "")") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    // print(String(decoding: data, as: UTF8.self))
                    let decoder = JSONDecoder()
                    recipeQueryResults = try! decoder.decode(QueryResult.self, from: data)
                    
                    if appendFlag {
                        self.queryResults?.append(contentsOf: (recipeQueryResults?.results ?? []))
                    }
                    else {
                        self.queryResults = recipeQueryResults?.results
                    }
                    
                    DispatchQueue.main.async {
                        self.delegate?.dataLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    
    func getRecipeDetails(id: Int) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/recipes/\(id)/information?apiKey=\(apiKey)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    // print(String(decoding: data, as: UTF8.self))
                    let decoder = JSONDecoder()
                    self.recipe = try! decoder.decode(RecipeDetail.self, from: data)
                    
                    
                    
                    DispatchQueue.main.async {
                        self.delegate?.dataLoaded()
                    }
                }
                
                
            }
            dataTask.resume()
        }
    }

    
}
