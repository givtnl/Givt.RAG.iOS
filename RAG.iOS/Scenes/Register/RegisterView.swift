//
//  RegisterView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var modelData = UserProfileData()

    var body: some View {
        VStack {
            TextField("Username", text: $modelData.userName)
            TextField("Email", text: $modelData.email)
            NavigationLink(destination: ProfileView(profile: modelData)) {
                Text("Save")
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
