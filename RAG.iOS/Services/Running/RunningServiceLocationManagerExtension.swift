//
//  RunningServiceLocationManagerExtension.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 21/04/2021.
//

import Foundation
import CoreLocation

extension RunningService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
            print("coordinates are empty")
            print("Performing checks again")
            _ = self.performChecks()
            return
        }
        
        updateLocation(location: manager.location!)

        if (state == .Initializing) {
            if (locationsToReceiveBeforeReady == 0) {
                print("Systems armed and ready for use")
                updateState(newState: .Ready)
                locationsToReceiveBeforeReady = 2
                return
            }
            locationsToReceiveBeforeReady -= 1
            return
        }
        
        if (state == .Running) {
            print("updated location")
            updatePosition(location: CLLocation(latitude: locValue.latitude, longitude: locValue.longitude))
        }
    }
}
