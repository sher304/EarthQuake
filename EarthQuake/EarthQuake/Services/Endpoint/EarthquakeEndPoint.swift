//
//  Earthquake.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation


enum EarthquakeEndPoint: EndpointProtocol {
    
    case getLatestEarthquake(month: String)
    case getEarthquake(startDate: String, endDate: String, magnitude: String)
    
    var path: String {
        switch self {
        case .getLatestEarthquake(let month):
            return API.getLatestEarthquake + "2024-\(month)-01&endtime=2024-\(month)-31&minmagnitude=5"
        case .getEarthquake(let startDate, let endDate, let magnitude):
            return API.getLatestEarthquake + "\(startDate)&endtime=\(endDate)&minmagnitude=\(magnitude)"
        }
    }
}
