//
//  ProfileView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

class UserProfileData: ObservableObject {
    var userName: String = ""
    var email: String = ""
}

struct ProfileView: View {
    var profile: UserProfileData
    
    var body: some View {
        VStack {
            Text(profile.userName)
            Text(profile.email)
            Text("Goal")
            
            NavigationLink(destination: StartRunView()) {
                Text("Run")
            }
            NavigationLink(destination: StartRunView()) {
                Text("Invite")
            }
            NavigationLink(destination: StartRunView()) {
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
