//
//  FinishView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

class RunResult: ObservableObject {
    var time: String = ""
    var distance: String = ""
    var pace: String = ""
}

struct FinishView: View {
    var results: RunResult
    
    var body: some View {
        VStack {
            
            Text(results.time)
            Text(results.distance)
            Text(results.pace)

            NavigationLink(destination: EventView()) {
                Text("Finish")
            }
            NavigationLink(destination: EventView()) {
                Text("Share")
            }
        }
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView(results: RunResult())
        
    }
}
