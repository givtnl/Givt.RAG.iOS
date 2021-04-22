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
            
            ZStack(alignment: .topLeading) {
                Image("Runner").resizable().scaledToFit().ignoresSafeArea(edges: .top)
                Image("OM_Logo").resizable().scaledToFit().frame(width: 80, height: 80, alignment: .topLeading).offset(x: 20, y: 50)
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

                Text("Goals")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                
                HStack(spacing: 20) {
                    HStack {
                        Text("20,50")
                            .padding(.leading, 15)
                            .font(Font.custom("Montserrat-Medium", size: 15))
                        Spacer()
                        Text("km")
                            .padding(.trailing, 15)
                            .font(Font.custom("Montserrat-SemiBold", size: 15))

                    }
                    .frame(width: UIScreen.main.bounds.width/2-40, height: 40, alignment: .leading)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                    
                    HStack {
                        Text("€")
                            .padding(.leading, 15)
                            .font(Font.custom("Montserrat-SemiBold", size: 15))
                        Text("1000")
                            .font(Font.custom("Montserrat-Medium", size: 15))

                    }
                    .frame(width: UIScreen.main.bounds.width/2-40, height: 40, alignment: .leading)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        try? Mediater.shared.sendAsync(request: RegisterUserCommand(name: modelData.userName, email: modelData.email, eventId: 65484)) { (didRegisterSuccessful) in
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
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(30)
            .background(Color.white)
            .cornerRadius(36, corners: .topRight)
            .ignoresSafeArea(edges: .all)
            .offset(y: -40)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .ignoresSafeArea(edges: .all)
        .onAppear(perform: {
            print(EventId)
        })
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(EventId: 1)
    }
}
