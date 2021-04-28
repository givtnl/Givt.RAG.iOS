//
//  RegisterView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var modelData = UserProfileData()
    @State private var didRegisterForEvent = false
    var EventId: String
    let userStore = UserStore.shared
    
    @ObservedObject var inputKilometers = DecimalNumbersOnlyValidator()
    @ObservedObject var inputAmount = DecimalNumbersOnlyValidator()
    
    var body: some View {
        VStack {
            NavigationLink(destination:
                            ProfileView(profile: UserProfileData(userName: modelData.userName, email: modelData.email, entryNumber: modelData.entryNumber, averageRunDistance: Double(inputKilometers.text) ?? 0), activeEventId: EventId)
                            .navigationBarTitle("")
                            .navigationBarHidden(true),
                           isActive: $didRegisterForEvent
            ) {
                EmptyView()
            }.isDetailLink(false)
            
            ZStack(alignment: .topLeading) {
                Image("Runner").resizable().scaledToFit().ignoresSafeArea(edges: .top)
                Image("TeenStreet_Logo").resizable().scaledToFit().frame(width: 80, height: 80, alignment: .topLeading).offset(x: 20, y: 50)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("I want to run!")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                
                TextField("Name", text: $modelData.userName)
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
                
                TextField("Entry Number", text: $modelData.entryNumber)
                    .padding(.leading, 10)
                    .frame(height: 40)
                    .background(Color("DarkerPink"))
                    .cornerRadius(5)
                    .font(Font.custom("Montserrat-Medium", size: 12))
                
                Text("On average I run")
                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                    .padding(.top, 10)
                
                HStack {
                    TextField("", text: $inputKilometers.text)
                        .padding(.leading, 15)
                        .frame(height: 40)
                        .font(Font.custom("Montserrat-Medium", size: 15))
                        .keyboardType(.decimalPad)
                    
                    Spacer()
                    Text("km")
                        .padding(.trailing, 15)
                        .font(Font.custom("Montserrat-SemiBold", size: 15))
                    
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 40,
                    maxHeight: 40,
                    alignment: .leading
                )
                .background(Color("DarkerPink"))
                .cornerRadius(5)
                
                HStack {
                    Spacer()
                    Button(action: {
                        try? Mediater.shared.sendAsync(request: RegisterUserCommand(name: modelData.userName, email: modelData.email, eventId: self.EventId, entryNumber: modelData.entryNumber)) { (didRegisterSuccessful) in
                            if didRegisterSuccessful {
                                didRegisterForEvent = didRegisterSuccessful
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
            guard let user = userStore.getUser(objectType: DataUser.self) else {
                return
            }
            let profile = UserProfileData()
            profile.email = (user as! DataUser).email
            profile.userName = (user as! DataUser).name
            modelData = profile
        })
        .hiddenNavigationBarStyle()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(EventId: "")
    }
}
