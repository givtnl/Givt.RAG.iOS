//
//  TrackingView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct TrackingView: View {
    @ObservedObject var runningManager = RunningService();
    var body: some View {
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
                }.padding(.top, 15)
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .center
            )
            .padding(40)
            .background(Color("DarkerPink"))
            .cornerRadius(10)
            
            Button(runningManager.state == RunningSystemState.Running ? "Stop" : "Start") {
                if (runningManager.state == RunningSystemState.Running) {
                    runningManager.stopRunning()
                    runningManager.initSystems()
                } else {
                    runningManager.startRunning()
                }
            }
            .font(Font.custom("Montserrat-SemiBold", size: 14))
            .frame(width: 100, height: 35).background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
            .offset(y: 30)
            .disabled(runningManager.state == .Initializing || runningManager.state == .Stopped)
        }
        .padding(30)
        .onAppear(perform: {
            runningManager.initSystems()
        })
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
