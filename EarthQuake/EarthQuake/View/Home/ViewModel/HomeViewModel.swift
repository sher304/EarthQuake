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
    
    // MARK: Func
    
    func getAccidents() {
        
        let accidentFirst =
        Feature(
            type: FeatureType(rawValue: "Feature")!,
            properties: Properties(
                mag: 1.2,
                place: "61 km SSE of Akkeshi, Japan",
                time: 1706045629390,
                updated: 1706047205040,
                tz: nil,
                url: "https://earthquake.usgs.gov/earthquakes/eventpage/us7000ltaz",
                detail: "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=us7000ltaz&format=geojson",
                felt: nil,
                cdi: nil,
                mmi: nil,
                alert: nil,
                status: Status(rawValue: "reviewed")!,
                tsunami: 0,
                sig: 400,
                net: Net(rawValue: "us")!,
                code: "7000ltaz",
                ids: ",us7000ltaz,",
                sources: ",us,",
                types: ",origin,phase-data,",
                nst: 111,
                dmin: 1.454,
                rms: 0.68,
                gap: 95,
                magType: MagType(rawValue: "mww")!,
                type: PropertiesType(rawValue: "earthquake")!,
                title: "M 5.1 - 67 km SSE of Akkeshi, Japan"
            ),
            geometry: Geometry(
                type: GeometryType(rawValue: "Point")!,
                coordinates: [145.0291, 42.4398, 35.463]
            ),
            id: "us7000lta2"
        )
        
        let accidentSecond = Feature(
            type: FeatureType(rawValue: "Feature")!,
            properties: Properties(
                mag: 3.21,
                place: "123123 km SSE of Akkeshi, Japan",
                time: 1706045629390,
                updated: 1706047205040,
                tz: nil,
                url: "https://earthquake.usgs.gov/earthquakes/eventpage/us7000ltaz",
                detail: "https://earthquake.usgs.gov/fdsnws/event/1/query?eventid=us7000ltaz&format=geojson",
                felt: nil,
                cdi: nil,
                mmi: nil,
                alert: nil,
                status: Status(rawValue: "reviewed")!,
                tsunami: 0,
                sig: 400,
                net: Net(rawValue: "us")!,
                code: "7000ltaz",
                ids: ",us7000ltaz,",
                sources: ",us,",
                types: ",origin,phase-data,",
                nst: 111,
                dmin: 1.454,
                rms: 0.68,
                gap: 95,
                magType: MagType(rawValue: "mww")!,
                type: PropertiesType(rawValue: "earthquake")!,
                title: "M 5.1 - 67 km SSE of Akkeshi, Japan"
            ),
            geometry: Geometry(
                type: GeometryType(rawValue: "Point")!,
                coordinates: [145.0291, 42.4398, 35.463]
            ),
            id: "us7000ltaz"
        )
        
        self.features.append(accidentFirst)
        self.features.append(accidentSecond)
    }
}
