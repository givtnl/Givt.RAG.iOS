//
//  ProfileView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct ProfileView: View {
    var profile: UserProfileData
    
    var body: some View {
        VStack {
            VStack {
                Image("BjornFace")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 125, height: 125)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 2)
                Text(profile.userName)
                    .font(Font.custom("Montserrat-Medium", size: 16))
                Text(profile.email)
                    .font(Font.custom("Montserrat", size: 12))
                
            }
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfileData())
    }
}
