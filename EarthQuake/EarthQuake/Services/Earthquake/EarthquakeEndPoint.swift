//
//  Earthquake.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation


enum EarthquakeEndPoint: EndpointProtocol {
    
    case getLatestEarthquake(date: String, month: String)
    
    var path: String {
        switch self {
        case .getLatestEarthquake(let date, let month):
            return API.getLatestEarthquake + "2024-\(month)-01&endtime=2024-\(month)-31&minmagnitude=5"
        }
    }
}
