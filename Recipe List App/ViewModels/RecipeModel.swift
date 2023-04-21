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
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
    
    // MARK: - Initialization
    
    init() {
        self.recipes = getData()
        
        self.categories = Set(self.recipes.map { r in
            r.category
        })
        
        self.categories.update(with: Constants.defaultListFilter)
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
    
    // MARK: - Get Ingredient Portions
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calculated whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
            
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
