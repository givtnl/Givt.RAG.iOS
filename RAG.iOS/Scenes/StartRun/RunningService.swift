//
//  RunningManager.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 19/04/2021.
//

import Foundation
import CoreLocation

class RunningService: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var currentDistance: Double = 0.0
    @Published var currentTime: Double = 0.01
    
    let locationManager = CLLocationManager()
    var lastSavedLocation: CLLocation? = nil
    
    var timer: Timer? = nil
    
    var doubleFormat = ".2"
    
    func startRunning() {
        if (isRunningAvailable()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.currentTime += 0.01
            }
        } else {
            print("running is not available")
        }
    }
    
    private func update() {
        
    }
    
    func stopRunning() {
        locationManager.stopUpdatingLocation()
        print(currentDistance)
        currentDistance = 0.0
        print(currentTime)
        timer?.invalidate()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        updatePosition(location: CLLocation(latitude: locValue.latitude, longitude: locValue.longitude))
    }
    
    func updatePosition(location: CLLocation) {
        
        // if location is nil then just update the last saved location
        guard let lastSaved = lastSavedLocation else {
            lastSavedLocation = location
            return
        }
        
        updateDistance(oldLocation: lastSaved, newLocation: location)
        
    }
    
    func updateDistance(oldLocation: CLLocation, newLocation: CLLocation) {
        let resultInMeters = oldLocation.distance(from: newLocation)
        lastSavedLocation = newLocation
        currentDistance += resultInMeters
    }

    func isRunningAvailable() -> Bool {
        self.locationManager.requestAlwaysAuthorization()
        return CLLocationManager.locationServicesEnabled();
    }
    
}
