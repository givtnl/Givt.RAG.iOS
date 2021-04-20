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
            HStack {
                VStack {
                    Text("07")
                    Text("Aug")
                }.padding(10).background(Color("LightPink"))
                VStack {
                    Text("Sponsor run")
                    Text("Kortrijk, 01:00 PM - 04:00 PM")
                }
            }.padding(10).background(Color.white).cornerRadius(5, corners: .allCorners).shadow(radius: 5)
            VStack(alignment: .leading) {
                Text("I want to run!")
                
                TextField("Username", text: $modelData.userName)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                    
                TextField("Email", text: $modelData.email)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ProfileView(profile: modelData)) {
                        Text("Register")
                    }
                    .frame(width: 100, height: 35).background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                }
            }.padding(20)
           
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
