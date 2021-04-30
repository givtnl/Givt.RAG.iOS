//
//  ProfileView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI
import OpenAPIClient

struct ProfileView: View {
    @State var profile: UserProfileData? = nil
    @State var events: [Event]? = nil
    @State private var showInviteSheet = false
    @State var participant: Participant? = nil
    var activeEventId: String? = nil
    @State var activeEvent: Event? = nil
    @State var eventFinished: Bool = true
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                    HStack(alignment: .center) {
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 106, height: 106)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                        
                        VStack(alignment: .leading) {
                            Text(profile!.userName)
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                            Text(profile!.email)
                                .font(Font.custom("Montserrat-Regular", size: 12))
                            HStack {
                                Image("LocationIcon")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                                Text("\(profile!.averageRunDistance.string) km")
                                    .font(Font.custom("Montserrat-Regular", size: 12))

                            }
                            .frame(width: 100, height: 25, alignment: .leading)
                            .background(Color("DarkerPink"))
                            .cornerRadius(25)
                        }
                        .padding(.leading, 10)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .padding(.horizontal, 30)
                    .padding(.top, 30)

                    // VStack with scrollview for events
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(events ?? [], id: \.self)
                                { event in
                                    EventCarouselViewItem(event: event, isActive: activeEventId == event.id)
                                }
                            }
                            .padding(.vertical, 15)
                        }
                    }
                    .frame(
                        height: 150
                    )
                    .padding(.leading, 30)
                    
                    // VStack with training info and motiviation
                    VStack(alignment: .leading, spacing: 15) {
                        if participant?.finishDate != nil {
                            Text("Results")
                                .font(Font.custom("Montserrat-SemiBold", size: 18))
                            HStack(spacing: 20) {
                                StatsView(imageName: "LocationIcon", title: "Distance", subTitle: "10, 00km")
                                StatsView(imageName: "TimeIcon", title: "Time", subTitle: "01:04:40")
                                StatsView(imageName: "PaceIcon", title: "Average pace", subTitle: "06:28 km/u")
                            }
                            .padding(.bottom, 20)
                        }
                        Text("Motivation")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        Text("I want the Ukranian TeenStreet to grow so they can reach more people. Because of the growth of my local TeenStreet, I had the chance to meet all of my new friends. Imma run this!")
                            .font(Font.custom("Montserrat-Regular", size: 12))
                        HStack {
                            ZStack {
                                Image("EmptyProfile")
                                Image("EmptyProfile")
                                    .offset(x: 30)
                                Image("EmptyProfile")
                                    .offset(x: 60)
                                Image("EmptyProfile")
                                    .offset(x: 90)
                            }
                            
                            Text("+ 12 backers")
                                .font(Font.custom("Montserrat-Medium", size: 12))
                                .offset(x: 90)
                            Spacer()
                            Text("learn about them")
                                .font(Font.custom("Montserrat-Medium", size: 8))
                                .foregroundColor(Color("OMRed"))
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                }
                HStack(spacing: 20) {
                    Button(action: {
                        showInviteSheet = true
                    }, label: {
                        Text("Invite")
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                            .frame(width: 125, height: 35)
                            .background(Color("OMRed"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                    NavigationLink(destination: TrackingView()) {
                        Text("Run")
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                            .frame(width: 125, height: 35)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 20)
                Spacer()
            }.onAppear(perform: {
                // This performs a get on all events which shouldn't be used but is used to fill the list
                try? Mediater.shared.sendAsync(request: GetAllEventsQuery()) { (events) in
                    self.events = events
                    if activeEventId != nil {
                        activeEvent = events.first(where: { event in
                            event.id == activeEventId
                        })
                    }
                }
                
                // This gets the actual current data from the server with the results
                _ = try? Mediater.shared.sendAsync(request: InAppUserQuery(), completion: { user in
                    try? Mediater.shared.sendAsync(request: GetCurrentParticipantQuery(eventId: (user?.eventId)!, participantId: (user?.id)!)) { (participant) in
                        self.participant = participant
                    }
                })
                
            }).sheet(isPresented: $showInviteSheet) {
                let user = try? Mediater.shared.send(request: InAppUserQuery())
                
                InviteBackerRepresentable(activityItems: [try! Mediater.shared.send(request: CreateInviteLinkCommand(eventId: user!.eventId!, participantId: user!.id!))])
                
            }.hiddenNavigationBarStyle()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView(
                profile: UserProfileData(
                    userName: "Mikey",
                    email: "Ah yeet@lol.zor",
                    entryNumber: "Ah yeet",
                    averageRunDistance: 111.11),
                events: [
                    Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk", endDate: Date()),
                    Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk", endDate: Date()),
                    Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk", endDate: Date())],
                activeEventId: "1")
        }
    }
}


