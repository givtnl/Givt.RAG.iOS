//
//  TrackingView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct TrackingView: View {
    @ObservedObject var runningService = RunningService();
    var body: some View {
        VStack {
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
                        Text(String(format: "%i:%2i", runningService.currentPace.0, runningService.currentPace.1))
                            .font(Font.custom("Montserrat-Bold", size: 25))
                        Text("min/km")
                            .font(Font.custom("Montserrat-Medium", size: 12))
                    }
                }.padding(.top, 15)
            }.padding(40).background(Color("DarkerPink")).cornerRadius(10)
            Button(runningService.state == RunningSystemState.Running ? "Stop" : "Start") {
                if (runningService.state == RunningSystemState.Running) {
                    runningService.stopRunning()
                    runningService.initSystems()
                } else {
                    runningService.startRunning()
                }
            }
                .font(Font.custom("Montserrat-SemiBold", size: 14))
                .frame(width: 100, height: 35).background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .offset(y: 30)
            .disabled(runningService.state == .Initializing || runningService.state == .Stopped)
        }.onAppear(perform: {
            runningService.initSystems()
        })
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
