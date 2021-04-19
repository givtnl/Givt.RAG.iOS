//
//  StartRunView.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 19/04/2021.
//

import SwiftUI

struct StartRunView: View {
    @ObservedObject var runningManager = RunningManager();

    var body: some View {
        VStack {
            Text(String(format: "%.1f s", runningManager.currentTime))
            Text(String(format: "Je hebt al %.2f km gelopen!", runningManager.currentDistance/1000))
        }
            .onAppear(perform: {
                runningManager.startRunning()
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
