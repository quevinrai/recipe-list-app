//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/17/23.
//

import Foundation

class RecipeModel: ObservableObject {
    // MARK: - Properties
    
    @Published var recipes = [Recipe]()
    
    // MARK: - Initialization
    
    init() {
        self.recipes = getData()
    }
    
    // MARK: - Methods
    
    func getData() -> [Recipe] {
        let url = Bundle.main.url(forResource: "recipes", withExtension: "json")
        
        if let url = url {
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    for r in recipeData {
                        r.id = UUID()
                        
                        for i in r.ingredients {
                            i.id = UUID()
                        }
                    }
                    
                    return recipeData
                } catch {
                    print(error)
                }
                
            } catch {
                print(error)
            }
        }
        
        return [Recipe]()
    }
}