//
//  StartRunView.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 19/04/2021.
//

import SwiftUI
import CoreLocation

struct StartRunView: View {
    let locationManager = CLLocationManager()
    let delegate = LocationDelegate()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                self.locationManager.requestAlwaysAuthorization()
                print(CLLocationManager.locationServicesEnabled())
                if CLLocationManager.locationServicesEnabled() {
                    print("YES")
                    locationManager.delegate = delegate
                    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                    locationManager.startUpdatingLocation()
                }
            })
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
}

struct StartRunView_Previews: PreviewProvider {
    static var previews: some View {
        StartRunView()
    }
}
