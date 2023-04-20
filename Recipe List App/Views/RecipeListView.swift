//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model: RecipeModel
    
    private var title: String {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return "All Recipes"
        }
        else {
            return model.selectedCategory!
        }
    }
    
    private var recipes: [Recipe] {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return model.recipes
        }
        else {
            return model.recipes.filter { return $0.category == title}
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextTitleView(title: title)
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(recipes) { r in
                            NavigationLink(value: r.id) {
                                HStack {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlightsView(highlights: r.highlights)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationDestination(for: UUID.self) { id in
                RecipeDetailView(id: id)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
