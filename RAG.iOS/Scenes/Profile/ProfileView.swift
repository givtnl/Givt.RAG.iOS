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
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                    HStack {
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                        VStack(alignment: .leading) {
                            Text(profile!.userName)
                                .font(Font.custom("Montserrat-SemiBold", size: 16))
                            Text(profile!.email)
                                .font(Font.custom("Montserrat", size: 12))
                        }.padding(.leading, 10)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .padding(.horizontal, 30)
                    
                    // VStack with scrollview for events
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                ForEach(events ?? [], id: \.self)
                                { event in
                                    EventCarouselViewItem(event: event)
                                }
                            }.padding(.vertical, 15)
                        }
                    }.frame(
                        height: 170
                    )
                    .padding(.leading, 30)
                    .padding(.top, 10)
                    
                    // VStack with training info and motiviation
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Training info")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        HStack {
                            Image("LocationArrow")
                            VStack(alignment: .leading) {
                                Text("Distance")
                                    .font(Font.custom("Montserrat-Regular", size: 8))
                                Text("10,00 km")
                                    .font(Font.custom("Montserrat-SemiBold", size: 11))
                            }.padding(.leading, 5)
                        }
                        Text("Motivation")
                            .font(Font.custom("Montserrat-SemiBold", size: 18))
                        Text("Pellentesque non massa leo. Donec quis mi eu enim accumsan venenatis. Vivamus ante eros, sed purus tortor. Curabitur ellentesque. Mauris nec dolor vel metus non ornare.")
                            .font(Font.custom("Montserrat-Regular", size: 12))
                    }
                    .padding(.horizontal, 30)
                }
                HStack(spacing: 20) {
                    Button(action: {
                        showInviteSheet = true
                    }, label: {
                        Text("Invite")
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                            .frame(width: 125, height: 35)
                            .background(Color("PrimaryColor"))
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
                InviteBackerRepresentable(activityItems: ["Ah yeet"])
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfileData())
    }
}
