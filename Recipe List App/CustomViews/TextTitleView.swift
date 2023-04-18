//
//  TextTitleView.swift
//  Recipe List App
//
//  Created by Quevin Bambasi on 4/18/23.
//

import SwiftUI

struct TextTitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(Font.custom("Avenir Heavy", size: 24))
    }
}

struct TextTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TextTitleView(title: "Featured Recipes")
    }
}
