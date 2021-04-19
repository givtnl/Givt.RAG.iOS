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
    @ObservedObject var delegate = LocationDelegate()

    var body: some View {
        Text(self.delegate.textToUpdate)
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


class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var textToUpdate: String = "Update me!"
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        calculateDistanceBetweenTwoLocations(location: CLLocation(latitude: locValue.latitude, longitude: locValue.longitude))
    }
    
    var lastSavedLocation: CLLocation? = nil
    var totalDistance: Double = 0.0
    var doubleFormat = ".2"
    
    func calculateDistanceBetweenTwoLocations(location: CLLocation) {
        guard let lastSaved = lastSavedLocation else {
            lastSavedLocation = location
            return
        }
            
        let resultInMeters = lastSaved.distance(from: location)
        lastSavedLocation = location
        totalDistance += resultInMeters
        print("difference between now and then:")
        print(resultInMeters)
        print("totalDistance in meters: ")
        print(totalDistance)
        textToUpdate = String(format: "Total distance so far: %.2f", totalDistance)
    }
}

struct StartRunView_Previews: PreviewProvider {
    static var previews: some View {
        StartRunView()
    }
}
