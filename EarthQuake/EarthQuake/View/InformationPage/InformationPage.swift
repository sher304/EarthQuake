//
//  InformationPage.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI
import MapKit

struct InformationPage: View {
    
    var feature: Feature
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    // MARK: View
    var body: some View {
        ZStack {
            MapViewRepresentable(selectedLocation: $selectedLocation)
                .ignoresSafeArea()
        }.onAppear(perform: {
            remakeLocation()
        })
        
    }
    
    // MARK: Func
    
    private func remakeLocation() {
        let coordinates = self.feature.geometry.coordinates
        let longitude = coordinates[0]
        let latitude = coordinates[1]
        selectedLocation = CLLocationCoordinate2D(latitude: latitude,
                                                  longitude: longitude)
    }
}

#Preview {
    InformationPage(feature:
                        Feature(
                            type: FeatureType(rawValue: "Feature")!,
                            properties: Properties(
                                mag: 5.1,
                                place: "67 km SSE of Akkeshi, Japan",
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
    )
}
