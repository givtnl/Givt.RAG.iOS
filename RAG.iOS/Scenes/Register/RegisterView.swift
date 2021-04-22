//
//  RegisterView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var modelData = UserProfileData()
    @State private var didRegisterForEvent = false
    var EventId: Int


    var body: some View {
        VStack {
            NavigationLink(destination:
                            ProfileView(profile: modelData),
                            isActive: $didRegisterForEvent
            ) {
                EmptyView()
            }
            VStack(alignment: .leading, spacing: 15) {
                Text("I want to run!")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                
                TextField("Username", text: $modelData.userName)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                    .font(Font.custom("Montserrat-Medium", size: 12))
                
                TextField("Email", text: $modelData.email)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                    .font(Font.custom("Montserrat-Medium", size: 12))

                HStack {
                    Spacer()
                    Button(action: {
                        try? Mediater.shared.sendAsync(request: RegisterUserCommand(name: modelData.userName, email: modelData.email)) { (didRegisterSuccessful) in
                            if didRegisterSuccessful {
                                try? Mediater.shared.sendAsync(request: JoinEventCommand(eventId: 1)) { (didJoinSuccessful) in
                                    if didJoinSuccessful {
                                        didRegisterForEvent = didJoinSuccessful
                                        print("Yes!")
                                    } else {
                                        print("user couldn't join the run")
                                    }
                                }
                            } else {
                                print("user not successfully registered")
                            }
                        }
                    }, label: {
                        Text("Register")
                            .font(Font.custom("Montserrat-SemiBold", size: 14))
                    })
                    .frame(width: 140, height: 35).background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }.padding(30)
           
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(EventId: 1)
    }
}
