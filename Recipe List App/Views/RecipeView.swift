//
//  ContentView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/17/23.
//

import SwiftUI

struct RecipeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)
            
            RecipeCategoryView()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Featured")
                    }
                }.tag(1)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Featured")
                    }
                }.tag(2)
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
