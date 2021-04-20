//
//  StartRunView.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 19/04/2021.
//

import SwiftUI

struct StartRunView: View {
    @ObservedObject var runningManager = RunningService();
    
    var body: some View {
        VStack {
            Text(String(format: "%.1f s", runningManager.currentTime))
            Text(String(format: "Je hebt al %.2f km gelopen!", runningManager.currentDistance/1000))
            Button(action: {
                runningManager.startRunning()
            }
            , label: {
                Text("Start running")
            })
            .disabled(runningManager.state != .Ready)
            Button(action: {
                runningManager.stopRunning()
                runningManager.initSystems()
            }
            , label: {
                Text("Stop running")
            })
            .disabled(runningManager.state != .Running)
        }
        .onAppear(perform: {
            self.runningManager.initSystems()
        })
        .onDisappear(perform: {
            runningManager.stopRunning()
        })
    }
}

struct StartRunView_Previews: PreviewProvider {
    static var previews: some View {
        StartRunView()
    }
}
