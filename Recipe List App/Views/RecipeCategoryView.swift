//
//  RecipeCategoryView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct RecipeCategoryView: View {
    @EnvironmentObject var model: RecipeModel
    @Binding var selectedTab: Int
    
    var categoryGridItems = [
        GridItem(.flexible(), spacing: 20, alignment: .top),
        GridItem(.flexible(), spacing: 20, alignment: .top)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            TextTitleView(title: "Categories")
            
            GeometryReader { geo in
                ScrollView {
                    LazyVGrid(columns: categoryGridItems, alignment: .center, spacing: 20) {
                        ForEach(Array(model.categories.sorted()), id: \.self) { category in
                            Button {
                                selectedTab = Constants.listTab
                                model.selectedCategory = category
                            } label: {
                                VStack {
                                    Image(category.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width - 20)/2, height: (geo.size.height - 20)/4)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(category)
                                }
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct RecipeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryView(selectedTab: .constant(1))
            .environmentObject(RecipeModel())
    }
}
