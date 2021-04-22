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
    private var eventId = 1

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
                    Text("SPONSOR RUN")
                        .font(Font.custom("Montserrat-Bold", size: 25))

                    Group {
                        InfoViewRow(logoString: "CalenderLogo", titleString: "Saturday, August 7, 2021", subTitleString: "01:00 PM - 04:00 PM")
                        InfoViewRow(logoString: "LocationArrow", titleString: "Kortrijk", subTitleString: "Kerkstraat 136")
                    }
                    VStack(alignment: .leading) {
                        Text("Over het evenement")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo")
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
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
