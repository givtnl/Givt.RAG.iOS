//
//  TrackingView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 20/04/2021.
//

import SwiftUI

struct TrackingView: View {
    var trackingData: TrackingViewData
    
    var body: some View {
        VStack {
            VStack {
                Text(trackingData.totalTime)
                    .font(Font.custom("Montserrat-Bold", size: 50))
                HStack {
                    VStack {
                        Text(trackingData.totalDistance)
                            .font(Font.custom("Montserrat-Bold", size: 25))
                        Text("km")
                            .font(Font.custom("Montserrat-Medium", size: 12))
                    }
                    VStack {
                        Text(trackingData.totalMinutesPerUnit)
                            .font(Font.custom("Montserrat-Bold", size: 25))
                        Text("min/km")
                            .font(Font.custom("Montserrat-Medium", size: 12))
                    }
                }.padding(.top, 15)
            }.padding(40).background(Color("DarkerPink")).cornerRadius(10)
            Button("Start") { print("Go") }
                .font(Font.custom("Montserrat-SemiBold", size: 14))
                .frame(width: 100, height: 35).background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .offset(y: 30)
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView(trackingData: TrackingViewData())
    }
}
