//
//  StatsView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 28/04/2021.
//

import SwiftUI

struct StatsView: View {
    var imageName: String
    var title: String
    var subTitle: String
    
    var body: some View {
        HStack {
            Image(imageName)
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("Montserrat-Regular", size: 8))
                Text(subTitle)
                    .font(Font.custom("Montserrat-SemiBold", size: 11))
            }.padding(.leading, 5)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(imageName: "LocationArrow", title: "Test", subTitle: "Testtjeueuhn")
    }
}
