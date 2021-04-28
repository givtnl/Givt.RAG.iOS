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
    var activeEventId: String
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                    HStack {
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
                                Image("LocationArrow")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                                Text("\(profile!.averageRunDistance.string) km")
                                    .font(Font.custom("Montserrat-Regular", size: 12))

                            }
                            .frame(width: 100, height: 25, alignment: .leading)
                            .background(Color("DarkerPink"))
                            .cornerRadius(25)
                        }
                        .padding(.leading, 5)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                    
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
//                        Text("Training info")
//                            .font(Font.custom("Montserrat-SemiBold", size: 18))
//                        HStack {
//                            Image("LocationArrow")
//                            VStack(alignment: .leading) {
//                                Text("Distance")
//                                    .font(Font.custom("Montserrat-Regular", size: 8))
//                                Text("10,00 km")
//                                    .font(Font.custom("Montserrat-SemiBold", size: 11))
//                            }.padding(.leading, 5)
//                        }
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
                try? Mediater.shared.sendAsync(request: GetAllEventsQuery()) { (events) in
                    self.events = events
                }
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
            ProfileView(profile: UserProfileData(userName: "Mikey", email: "Ah yeet@lol.zor", entryNumber: "Ah yeet", averageRunDistance: 111.11), events: [Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk"), Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk"),Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk")], activeEventId: "EventId")
            ProfileView(profile: UserProfileData(userName: "Mikey", email: "Ah yeet@lol.zor", entryNumber: "Ah yeet", averageRunDistance: 111.11), events: [Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk"), Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk"),Event(id: "1", name: "Test", startDate: Date(), city: "Kortrijk")], activeEventId: "EventId")
        }
    }
}


