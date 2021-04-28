//
//  EventCarouselViewItem.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 23/04/2021.
//

import SwiftUI

struct EventCarouselViewItem: View {
    var event: Event
    var monthDateFormatter: DateFormatter = DateFormatter()
    var isActive: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image("Runner").resizable().scaledToFill()
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(Font.custom("Montserrat-SemiBold", size: 11))
                        .foregroundColor(isActive ? Color.white : Color.black)

                    Text(event.city)
                        .font(Font.custom("Montserrat-Regular", size: 9))
                        .foregroundColor(isActive ? Color.white : Color.gray)

                }
                .padding(.leading, 10)
                .padding(.top, 10)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .frame(height: 50)
                .background(isActive ? Color("OMRed") : Color.white)
                VStack {
                    Text(String(Calendar.current.dateComponents([.day], from: event.startDate).day!))
                        .font(Font.custom("Montserrat-SemiBold", size: 11))
                        .foregroundColor(Color("OMRed"))
                    Text(monthDateFormatter.string(from: event.startDate))
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
        ).frame(width: 140).ignoresSafeArea(edges: .all)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
    }
    
    init(event: Event, isActive: Bool = false) {
        self.event = event
        self.isActive = isActive
        monthDateFormatter.dateFormat = "MMM"
    }
}

struct EventCarouselViewItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventCarouselViewItem(event: Event(id: "1234", name: "TestEvent", startDate: Date(), city: "Shortrealm", endDate: Date()))
                .previewLayout(.fixed(width: 140, height: 110))
        }
    }
}
