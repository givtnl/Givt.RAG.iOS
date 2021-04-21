//
//  FinishView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

class RunResult: ObservableObject {
    var time: String
    var distance: String
    var amount: String
    
    init(time: String, distance: String, amount: String) {
        self.time = time
        self.distance = distance
        self.amount = amount
    }
}

struct FinishView: View {
    var results: RunResult
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("RESULTS")
                    .font(Font.custom("Montserrat-Bold", size: 25))
                HStack(){
                    VStack {
                        Text(results.time)
                            .font(Font.custom("Montserrat-Bold", size: 16))
                        Text("Time")
                            .font(Font.custom("Montserrat", size: 10))
                    }.frame(width: 95, height: 95)
                    .background(Color.white)
                    .cornerRadius(35)
                    .shadow(radius: 5)
                    Spacer()
                    VStack {
                        Text(results.distance)
                            .font(Font.custom("Montserrat-Bold", size: 16))
                        Text("Distance")
                            .font(Font.custom("Montserrat", size: 10))
                    }.frame(width: 95, height: 95)
                        .background(Color.white)
                        .cornerRadius(35)
                        .shadow(radius: 5)
                    Spacer()
                    VStack {
                        Text(results.amount)
                            .font(Font.custom("Montserrat-Bold", size: 16))
                        Text("Amount raised")
                            .font(Font.custom("Montserrat", size: 10))
                    }.frame(width: 95, height: 95)
                        .background(Color.white)
                        .cornerRadius(35)
                        .shadow(radius: 5)
                }
                Spacer()
                HStack {
                    NavigationLink(destination: RegisterView()){
                        Text("Ah yeet")
                    }.frame(width: 250, height: 50)
                        .background(Color.black)
                        .cornerRadius(25)
                        .foregroundColor(Color.white)
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .center)
            }.padding(30)
             .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
            
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading)
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView(results: RunResult(time: "0:15:45", distance: "0.10 km", amount: "shekkels"))
        
    }
}
