//
//  ProfileView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI
struct CarouselTest: Identifiable {
    let id = UUID()
    var text = "Ah yeet"
}

struct ProfileView: View {
    @State var profile: UserProfileData? = nil
    
    @State var events = [CarouselTest]()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("BjornFace")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .shadow(radius: 2)
                    VStack(alignment: .leading) {
                        Text(profile!.userName)
                            .font(Font.custom("Montserrat-SemiBold", size: 16))
                        Text(profile!.email)
                            .font(Font.custom("Montserrat", size: 12))
                    }.padding(.leading, 10)
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding(.horizontal, 30)
            
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        EventCarouselViewItem()
                        EventCarouselViewItem()
                        EventCarouselViewItem()
                        EventCarouselViewItem()
                    }.padding(.vertical, 10)
                }
            }.frame(
                height: 160
            ).padding(.leading, 30)
            VStack(alignment: .leading, spacing: 0) {
                Text("Events").padding(.leading, 30)
                EventRowView().padding([.top, .bottom], 10)
            }.padding(.top, 40)
            Spacer()
            HStack {
                NavigationLink(destination: TrackingView()) {
                    Text("Invite")
                        .font(Font.custom("Montserrat-SemiBold", size: 14))
                        .frame(width: 125, height: 35)
                        .background(Color("PrimaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: TrackingView()) {
                    Text("Run")
                        .font(Font.custom("Montserrat-SemiBold", size: 14))
                        .frame(width: 125, height: 35)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }.onAppear(perform: {
            let test = CarouselTest(text: "Ah yeet")
            self.events.append(test)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfileData())
    }
}
