//
//  EvenRowView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 21/04/2021.
//

import SwiftUI

struct EventRowView: View {
    var body: some View {
        HStack {
            VStack {
                Text("07")
                    .font(Font.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Color("PrimaryColor"))
                Text("Aug")
                    .font(Font.custom("Montserrat-Medium", size: 14))
                
            }
            .padding(12)
            .background(Color("LightPink"))
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Sponsor run")
                    .font(Font.custom("Montserrat-Medium", size: 15))
                Text("Kortrijk, 01:00 PM - 04:00 PM")
                    .font(Font.custom("Montserrat-Medium", size: 10))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 5)
            .padding(.trailing, 15)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .background(Color.white)
        .cornerRadius(10, corners: .allCorners)
        .shadow(radius: 5)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct EvenRowView_Previews: PreviewProvider {
    static var previews: some View {
        EventRowView()
    }
}
