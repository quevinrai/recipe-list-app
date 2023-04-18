//
//  ContentView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/17/23.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}