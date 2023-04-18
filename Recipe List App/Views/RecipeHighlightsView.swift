//
//  RecipeHighlightsView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct RecipeHighlightsView: View {
    var highlights: [String]
    
    var allHighlights: String {
        var newString = ""
        
        for index in 0..<highlights.count {
            if index == highlights.count-1 {
                newString += highlights[index]
            }
            else {
                newString += highlights[index] + ", "
            }
        }
        
        return newString
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["Vegetarian", "Healthy", "Easy-cleanup"])
    }
}
