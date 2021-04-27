//
//  InfoView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 27/04/2021.
//

import SwiftUI

struct InfoView: View {
    var titleText: String
    var subtitleText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(Font.custom("Montserrat-Bold", size: 13))
            Text(subtitleText)
                .font(Font.custom("Montserrat", size: 8))
        }.frame(width: 65, height: 65)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(titleText: "Titel", subtitleText: "Subtitel")
    }
}
