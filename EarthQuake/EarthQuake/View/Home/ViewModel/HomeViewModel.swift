//
//  HomeViewModel.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 7/2/24.
//

import Foundation
import CoreLocation
import MapKit

final class HomeViewModel: NSObject, ObservableObject {
    
    // MARK: Properties
    @Published var features: [Feature] = []
    var userLocation: CLLocationCoordinate2D?
    var earthquakeService: EarthquakeService
    
    // MARK: Init
    init(earthquakeService: EarthquakeService) {
        self.earthquakeService = earthquakeService
    }
    
    
    // MARK: Func 
    func getLatestAccidents() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year = components.year?.description ?? ""
        let month = components.month?.description ?? ""
        let day = components.day?.description ?? ""
        earthquakeService.getLatestEarthquake(
            date: "\(year)-\(month)-\(day)", month: "\(month)",
            completion: { [weak self] result in
                switch result {
                case .success(let model):
                    guard let data = model else { return }
                    self?.features.append(contentsOf: data.features)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
    }
    
    func calculateDistance(latitude: Double, longitude: Double) -> Int {
        guard let userCoordinate = self.userLocation else { return 0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude,
                                      longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInKm = Int(userLocation.distance(from: destination) / 1000)
        return distanceInKm
    }    
}
