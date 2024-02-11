//
//  Endpoint.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation



protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
}


extension EndpointProtocol {
    var baseURL: String {
        return "https://earthquake.usgs.gov/fdsnws/event/1/"
    }   
}
