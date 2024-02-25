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
    @Published var isLoading = false
    @Published var isEmpty = false
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var magnitude = 5
    @Published var isBigAmount = false
    
    var userLocation: CLLocationCoordinate2D?
    var earthquakeService: EarthquakeService
    
    // MARK: Init
    init(earthquakeService: EarthquakeService) {
        self.earthquakeService = earthquakeService
    }
    
    
    // MARK: Func 
    func getLatestAccidents() {
        self.isLoading = true
        self.features = []
        
        let dates = getDate()
        earthquakeService.getLatestEarthquake(
            month: "\(dates[1])",
            completion: { [weak self] result in
                switch result {
                case .success(let model):
                    guard let data = model else { return }
                    self?.features = data.features
                    self?.isLoading = false
                case .failure(let error):
                    self?.isBigAmount = true
                    print(error.localizedDescription, "getLatestAccidents")
                }
            })
    }
    
    func getDate() -> [String] {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year = components.year?.description ?? ""
        let month = components.month?.description ?? ""
        let day = components.day?.description ?? ""

        return [year, month, day]
    }
    
    func calculateDistance(latitude: Double, longitude: Double) -> Int {
        guard let userCoordinate = self.userLocation else { return 0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude,
                                      longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInKm = Int(userLocation.distance(from: destination) / 1000)
        return distanceInKm
    }   
    
    func updateFilter() {
        self.isLoading = true
        self.features = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.string(from: startDate)
        let endDate = dateFormatter.string(from: endDate)
        earthquakeService.getEarthquake(startDate: startDate, EndDate: endDate, magnitude: magnitude) { [weak self] result in
            switch result {
            case .success(let model):
                guard let data = model else { return }
                self?.isEmpty = data.features.isEmpty ? true : false
                self?.features = data.features
                self?.isLoading = false
            case .failure(let error):
                self?.isBigAmount = true
                self?.isLoading = false
                print(error.localizedDescription, "updateFilter")
            }
        }
    }
}

