//
//  ContentView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import SwiftUI
import CoreData
import OpenAPIClient

struct EventView: View {
    @State private var canJoinEvent = false
    @State private var event: Event? = nil

    @State private var eventId = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                NavigationLink(destination:
                                RegisterView(event: event),
                               isActive: $canJoinEvent
                ) {
                    EmptyView()
                }
                ZStack(alignment: .topLeading) {
                    Image("Runner").resizable().scaledToFit().ignoresSafeArea(edges: .top)
                    Image("TeenStreet_Logo").resizable().scaledToFit().frame(width: 120, height: 60, alignment: .topLeading).offset(x: 20, y: 50)
                }
                VStack(alignment: .leading) {
                    Text(event?.name.uppercased() ?? "")
                        .font(Font.custom("Montserrat-Bold", size: 25))
                    
                    Group {
                        InfoViewRow(logoString: "CalenderIcon", titleString: event?.startDate.formattedLong ?? "", subTitleString: event?.startDate.formattedTimeSpan(until: event!.endDate) ?? "")
                        InfoViewRow(logoString: "LocationIcon", titleString: event?.city ?? "", subTitleString: event?.city ?? "")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("About the event")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        Text(event?.comment ?? "")
                            .font(Font.custom("Montserrat-Regular", size: 13))
                            .padding(.top, 1)
                        Button(action: {
                            canJoinEvent = true
                        }) {
                            HStack {
                                Image("TinyRunningWoman")
                                    .renderingMode(.original)
                                Text("Join our run")
                                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 25)
                                    .padding(10)
                                    .background(Color("OMRed"))
                                    .cornerRadius(25)
                            }
                        }.buttonStyle(PlainButtonStyle())
                        .offset(y: 20)
                    }.offset(y: 15)
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                ).padding(30).background(Color.white).cornerRadius(36, corners: .topRight).ignoresSafeArea(edges: .all).offset(y: -40)
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            ).ignoresSafeArea(edges: .all)
            .hiddenNavigationBarStyle()

        }.onAppear(perform: {
            try? Mediater.shared.sendAsync(request: GetAllEventsQuery()) { (response) in
                event = response[0]

                EventsAPI.getEventDetail(id: response[0].id) { model, _ in
                    self.event?.comment = model?.comment
                }
                
                eventId = event!.id
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
