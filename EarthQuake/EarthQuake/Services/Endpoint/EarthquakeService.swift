//
//  EarthquakeService.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 10/2/24.
//

import Foundation


protocol EarthquakeService {
    func getLatestEarthquake(month: String,
                             completion: @escaping(NetworkResult<EmptyResponce?>) -> Void)
    
    func getEarthquake(startDate: String, EndDate: String, magnitude: Int, completion: @escaping(NetworkResult<EmptyResponce?>) -> Void)
}


final class EarthquakeServiceImpl: EarthquakeService {
    
    let networkService: NetworkService<EarthquakeEndPoint>
    
    init(networkService: NetworkService<EarthquakeEndPoint>) {
        self.networkService = networkService
    }
    
    func getLatestEarthquake(month: String, completion: @escaping (NetworkResult<EmptyResponce?>) -> Void) {
        let endPoint = EarthquakeEndPoint.getLatestEarthquake(month: month)
        networkService.request(enpoint: endPoint, completion: completion)
    }
    
    func getEarthquake(startDate: String, EndDate: String, magnitude: Int, completion: @escaping (NetworkResult<EmptyResponce?>) -> Void) {
        let endPoint = EarthquakeEndPoint.getEarthquake(startDate: startDate, endDate: EndDate, magnitude: magnitude.description)
        networkService.request(enpoint: endPoint, completion: completion)
    }
}
