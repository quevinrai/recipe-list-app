//
//  Recipe.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import Foundation

class Recipe: Identifiable, Hashable, Decodable {
    var id: UUID? = UUID()
    var name: String = "Recipe Name"
    var category: String = "Recipe Category"
    var featured: Bool = false
    var image: String = "eggplant parmesan"
    var description: String = "Recipe Description"
    var prepTime: String = "Recipe Prep Time"
    var cookTime: String = "Recipe Cook Time"
    var totalTime: String = "Recipe Total Time"
    var servings: Int = 1
    var highlights: [String] = ["List of Recipe Highlights"]
    var ingredients: [Ingredient] = [Ingredient()]
    var directions: [String] = ["List of Recipe Directions"]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}

class Ingredient: Identifiable, Hashable, Decodable {
    var id: UUID? = UUID()
    var name: String = "Ingredient Name"
    var num: Int? = 1
    var denom: Int? = 3
    var unit: String? = "kg"
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.id == rhs.id
    }
}
