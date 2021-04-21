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
                
                Text("John Doe")
                    .font(Font.custom("Montserrat-Medium", size: 16))
                Text("johndoe@givtapp.net")
                    .font(Font.custom("Montserrat", size: 12))
                
            }
            
            Text("Events")
            
            EventRowView().padding([.top, .bottom], 20)

            Text(profile.userName)
            Text(profile.email)
            Text("Goal")
            
            NavigationLink(destination: TrackingView()) {
                Text("Run")
            }
            NavigationLink(destination: TrackingView()) {
                Text("Invite")
            }
            NavigationLink(destination: TrackingView()) {
                Text("Save")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: UserProfileData())
    }
}
