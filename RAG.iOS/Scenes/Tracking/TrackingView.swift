//
//  TrackingView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI
import MapKit

struct TrackingView: View {
    @ObservedObject var runningManager = RunningService();
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
            VStack {
                Spacer()
                VStack {
                    VStack {
                        Text(String(format: "%.1f", runningManager.currentTime))
                            .font(Font.custom("Montserrat-Bold", size: 50))
                        HStack {
                            VStack {
                                Text(String(format: "%.2f", runningManager.currentDistance/1000))
                                    .font(Font.custom("Montserrat-Bold", size: 25))
                                Text("km")
                                    .font(Font.custom("Montserrat-Medium", size: 12))
                            }
                            VStack {
                                Text(String(format: "%i:%02d", runningManager.currentPace.0, runningManager.currentPace.1))
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
                    
                    Button(runningManager.state == RunningSystemState.Running ? "Stop" : "Start") {
                        if (runningManager.state == RunningSystemState.Running) {
                            runningManager.stopRunning()
                            runningManager.initSystems()
                        } else {
                            runningManager.startRunning()
                        }
                    }
                    .font(Font.custom("Montserrat-SemiBold", size: 14))
                    .frame(width: 240, height: 50).background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .disabled(runningManager.state == .Initializing || runningManager.state == .Stopped)
                    .padding(.bottom, 20)
                    
                }.background(Color.white).cornerRadius(25, corners: .topRight)
            }
            .onAppear(perform: {
                runningManager.initSystems()
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
