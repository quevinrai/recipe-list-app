//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var selectedServingSize = 2
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .bold()
                        .padding(.vertical, 20)
                        .font(Font.custom("Avenir Heavy", size: 24))
                    
                    VStack(alignment: .leading) {
                        Text("Select your seving size:")
                        Picker("Serving Size", selection: $selectedServingSize) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                        }
                        .font(Font.custom("Avenir", size: 15))
                        .pickerStyle(.segmented)
                        .frame(width:160)
                    }
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(Font.custom("Avenir Heavy", size: 16))
                            .padding([.bottom, .top], 5)
                        
                        ForEach(recipe.ingredients) {ingredient in
                            Text("• " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ingredient.name.lowercased())
                                .font(Font.custom("Avenir", size: 15))
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Directions")
                            .font(Font.custom("Avenir Heavy", size: 16))
                            .padding([.bottom, .top], 5)
                        
                        ForEach(0..<recipe.directions.count, id: \.self) { index in
                            Text(String(index+1) + ". " + recipe.directions[index])
                                .padding(.bottom, 5)
                                .font(Font.custom("Avenir", size: 15))
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe())
    }
}
