//
//  LocationManager.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import Foundation
import CoreLocation


final class LocationManager: NSObject, ObservableObject {
    
    // MARK: Properties
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    @Published var userCurrentLocation: CLLocationCoordinate2D?
    
    
    // MARK: Init
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


// MARK: CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else { return }
        self.userCurrentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        self.locationManager.stopUpdatingLocation()
    }
}
