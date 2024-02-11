//
//  EarthquakeService.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 10/2/24.
//

import Foundation


protocol EarthquakeService {
    func getLatestEarthquake(date: String, month: String, completion: @escaping(NetworkResult<EmptyResponce?>) -> Void)
}


final class EarthquakeServiceImpl: EarthquakeService {
    
    let networkService: NetworkService<EarthquakeEndPoint>
    
    init(networkService: NetworkService<EarthquakeEndPoint>) {
        self.networkService = networkService
    }
    
    func getLatestEarthquake(date: String, month: String, completion: @escaping (NetworkResult<EmptyResponce?>) -> Void) {
        let endPoint = EarthquakeEndPoint.getLatestEarthquake(date: date, month: month)
        networkService.request(enpoint: endPoint, completion: completion)
    }
}
