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
    @State private var event: DataEvent? = nil

    @State private var eventId = 0
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                NavigationLink(destination:
                                RegisterView(EventId: eventId),
                               isActive: $canJoinEvent
                ) {
                    EmptyView()
                }
                ZStack(alignment: .topLeading) {
                    Image("Runner").resizable().scaledToFit().ignoresSafeArea(edges: .top)
                    Image("OM_Logo").resizable().scaledToFit().frame(width: 80, height: 80, alignment: .topLeading).offset(x: 20, y: 50)
                }
                VStack(alignment: .leading) {
                    Text(event?.name ?? "")
                        .font(Font.custom("Montserrat-Bold", size: 25))
                    
                    Group {
                        InfoViewRow(logoString: "CalenderLogo", titleString: event?.startDate.formattedLong ?? "", subTitleString: event?.startDate.formattedTimeSpan(until: event!.endDate) ?? "")
                        InfoViewRow(logoString: "LocationArrow", titleString: event?.city ?? "", subTitleString: event?.address ?? "")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("About the event")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        Text(event?.eventDescription ?? "")
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
                                    .frame(width: 160, height: 25)
                                    .padding(10)
                                    .background(Color("OMRed"))
                                    .cornerRadius(25)
                            }
                        }.buttonStyle(PlainButtonStyle())
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
        }.onAppear(perform: {
            event = RunningStore.shared.getBy(objectType: DataEvent.self, primaryKey: 1) as? DataEvent
            if event != nil {
                eventId = 1
            }
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
