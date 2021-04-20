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
