//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var selectedTabIndex = 0
    
    var body: some View {
        let featuredRecipes = model.recipes.filter { $0.featured }
        
        VStack(alignment: .leading, spacing: 0) {
            TextTitleView(title: "Featured Recipes")
                .padding(.horizontal)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView(selection: $selectedTabIndex) {
                    ForEach(0..<featuredRecipes.count, id: \.self) { index in
                        Button {
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                    Text(featuredRecipes[index].name)
                                        .padding(5)
                                        .font(Font.custom("Avenir", size: 15))
                                }
                            }
                        }
                        .tag(index)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[selectedTabIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlightsView(highlights: model.recipes[selectedTabIndex].highlights)
            }
            .padding()
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
