//
//  InfoViewRow.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import SwiftUI

struct InfoViewRow: View {
    var logoString: String
    var titleString: String
    var subTitleString: String
    
    var body: some View {
        HStack {
            Image(logoString).resizable().scaledToFit().frame(width: 36, height: 36, alignment: .topLeading)
            VStack(alignment: .leading, spacing: 1) {
                Text(titleString)
                    .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
                Text(subTitleString)
                    .font(.caption2)
            }.offset(x: 10, y: 0)
        }
        
    }
}

struct InfoViewRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoViewRow(logoString: "OM_Logo", titleString: "Ah yeet", subTitleString: "Cava?")
                .previewLayout(.sizeThatFits)
            InfoViewRow(logoString: "OM_Logo", titleString: "Jabeja", subTitleString: "En me gie?")
                .previewLayout(.sizeThatFits)
        }
    }
}
