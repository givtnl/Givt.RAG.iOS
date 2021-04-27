//
//  TrackingView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI
import MapKit

struct TrackingView: View {
    @ObservedObject var runningService = RunningService.shared;
    @State private var isDoneWithRunning = false
    
    var body: some View {
        ZStack {
            NavigationLink(destination:
                            FinishView(results:
                                        RunResult(
                                            time: runningService.currentTime,
                                            distance: runningService.currentDistance,
                                            amount: 0.0)
                            ),
                            isActive: $isDoneWithRunning
            ) {
                EmptyView()
            }
            
            Map(coordinateRegion: $runningService.currentLocation.coordinates, annotationItems: runningService.currentLocationArray){ annotation in
                MapAnnotation(
                    coordinate: annotation.coordinates.center,
                                anchorPoint: CGPoint(x: 0.5, y: 0.5)
                            ) {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 25/10))
                                .shadow(radius: 10)
                            }
            }
            .padding(.bottom, 240)
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    VStack {
                        Text(String(format: "%.1f", runningService.currentTime))
                            .font(Font.custom("Montserrat-Bold", size: 50))
                        HStack {
                            VStack {
                                Text(String(format: "%.2f", runningService.currentDistance/1000))
                                    .font(Font.custom("Montserrat-Bold", size: 25))
                                Text("km")
                                    .font(Font.custom("Montserrat-Medium", size: 12))
                            }
                            VStack {
                                Text(String(format: "%i:%02d", runningService.currentPace.0, runningService.currentPace.1))
                                    .font(Font.custom("Montserrat-Bold", size: 25))
                                Text("min/km")
                                    .font(Font.custom("Montserrat-Medium", size: 12))
                            }
                        }
                        .padding(.top, 15)
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        alignment: .center
                    )
                    .padding(40)
                    
                    Button(action: {
                        if (runningService.state == RunningSystemState.Running) {
                            runningService.stopRunning()
                            if let user = try? Mediater.shared.send(request: InAppUserQuery()) {
                                try? Mediater.shared.sendAsync(request: StopRunningCommand(user: user), completion: { (response) in
                                    isDoneWithRunning = true
                                })
                            }
                        } else {
                            if let user = try? Mediater.shared.send(request: InAppUserQuery()) {
                                try? Mediater.shared.sendAsync(request: StartRunningCommand(user: user), completion: { (response) in
                                    print(response)
                                    runningService.startRunning()
                                })
                            }
                        }
                    }) {
                        Text(runningService.state == RunningSystemState.Running ? "Stop" : "Start")
                            .font(Font.custom("Montserrat-SemiBold", size: 20))
                            .frame(width: 240, height: 50)
                            .background(runningService.state == RunningSystemState.Running ? Color("PrimaryColor") : Color.white)
                            .foregroundColor(runningService.state == RunningSystemState.Running ? Color.white : Color("PrimaryColor"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(runningService.state == RunningSystemState.Running ? Color.white : Color("PrimaryColor"), lineWidth: 2)
                            )

                    }
                    .disabled(runningService.state == .Initializing || runningService.state == .Stopped)
                    Spacer()
                }
                .frame(height:320)
                .background(Color.white)
                .cornerRadius(25, corners: .topRight)
            }
            .onAppear(perform: {
                runningService.initSystems()
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            ).ignoresSafeArea(edges: .top)
        }.ignoresSafeArea(edges: .top)
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
