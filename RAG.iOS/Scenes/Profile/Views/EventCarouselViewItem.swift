//
//  EventCarouselViewItem.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 23/04/2021.
//

import SwiftUI

struct EventCarouselViewItem: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image("Runner").resizable().scaledToFill()
                VStack(alignment: .leading) {
                    Text("Sponsor run")
                        .font(Font.custom("Montserrat-SemiBold", size: 11))

                    Text("Kortrijk")
                        .font(Font.custom("Montserrat-Regular", size: 9))
                        .foregroundColor(.gray)

                }
                .padding(.leading, 10)
                .padding(.top, 10)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .frame(height: 50)
                .background(Color.white)
                VStack {
                    Text("08")
                        .font(Font.custom("Montserrat-SemiBold", size: 11))
                        .foregroundColor(Color("PrimaryColor"))
                    Text("Aug")
                        .font(Font.custom("Montserrat-Regular", size: 9))

                }
                .frame(width: 30, height: 30)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .offset(x: 10, y: -38)
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
        }.frame(
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        ).frame(width: 160).ignoresSafeArea(edges: .all)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
    }
}

struct EventCarouselViewItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventCarouselViewItem()
                .previewLayout(.fixed(width: 140, height: 110))
        }
    }
}
