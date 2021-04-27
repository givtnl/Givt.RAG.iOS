//
//  FinishView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

class RunResult: ObservableObject {
    var time: Double
    var distance: Double
    var amount: Double
    
    init(time: Double, distance: Double, amount: Double) {
        self.time = time
        self.distance = distance
        self.amount = amount
    }
}

struct FinishView: View {
    var results: RunResult
    
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    @State var navigateToProfile: Bool = false
    @State var profile: UserProfileData? = nil
    

    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: ProfileView(profile: profile, events: nil), isActive: $navigateToProfile) {
                EmptyView()
            }
            ZStack {
                VStack(alignment: .leading) {
                    if image == nil {
                        Button(action: {
                            self.showCaptureImageView.toggle()
                        }, label: {
                            HStack {
                                Image("SelfieImage")
                                Text("Take your sweatest selfie")
                                    .font(Font.custom("Montserrat-SemiBold", size: 18))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                            }
                            .padding(.leading, 20)
                        })
                    }
                    Spacer()
                    
                    HStack(spacing: 15){
                        InfoView(titleText: String(format: "%02d:%02d:%02d",
                                                   Int(floor(self.results.time/3600)),
                                                   Int(floor(self.results.time.truncatingRemainder(dividingBy: 3600) / 60)),
                                                   Int(floor(self.results.time.truncatingRemainder(dividingBy: 60)))
                                       ), subtitleText: "time")
                        InfoView(titleText: String(format: "%.2f", results.distance/1000), subtitleText: "km")
                        InfoView(titleText: String(format: "%02d:%02d", calculateAveragePace(time: self.results.time, distance: self.results.distance).0, calculateAveragePace(time: self.results.time, distance: self.results.distance).1), subtitleText: "min/km")
                        
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .center)
                    
                    
                }.frame(height: 260).padding(30)
                
                if (showCaptureImageView) {
                    CaptureImageView(isShown: $showCaptureImageView, image: $image)
                }
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("THANK.YOU.SO.MUCH, [NAME RUNNER]!")
                    .font(Font.custom("Montserrat-SemiBold", size: 22))
                    .foregroundColor(Color("PrimaryColor"))
                Text("For overcoming the glue that was sticking you to your couch, for choosing to invest in running shoes instead of thee best mascara in the world, for running for your life (for real, not in game) and for casting out so much sweat that you could fill the local swimming pool. Thank you for running with us!")
                    .font(Font.custom("Montserrat-Regular", size: 12))
                Text("The TeenStreet global team")
                    .font(Font.custom("Montserrat-Bold", size: 12))
                Spacer()
                HStack(alignment: .center) {
                    Image("Share")
                        .frame(width: 50, height: 50)
                    Button {
                        try? Mediater.shared.sendAsync(request: InAppUserQuery()) { (response) in
                            self.profile = (response!).getAsProfileData()
                            self.navigateToProfile = true
                        }
                    } label: {
                        Text("Finish")
                            .font(Font.custom("Montserrat-SemiBold", size: 20))
                    }
                    .frame(width: 250, height: 50)
                    .background(Color.black)
                    .cornerRadius(25)
                    .foregroundColor(Color.white)
                }
                
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
            .padding(30)
            .background(Color.white)
            .cornerRadius(35, corners: .topRight)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading)
        .padding(.top, 20)
        .background(image == nil ? Color("BackgroundFinishView") : nil)
        .background(image != nil ?
                        image?
                        .resizable()
                        .scaledToFit()
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .topLeading) : nil)
        .ignoresSafeArea(edges: .top)
        .hiddenNavigationBarStyle()
        
    }
}

func calculateAveragePace(time: Double, distance: Double) -> (Int, Int) {
    let secondsPerKilometer = round(time / distance * 1000)
    return (Int(floor(secondsPerKilometer.truncatingRemainder(dividingBy: 3600) / 60)), Int(floor(secondsPerKilometer.truncatingRemainder(dividingBy: 60))))
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView(results: RunResult(time: 43.8, distance: 10000, amount: 250))
        
    }
}
