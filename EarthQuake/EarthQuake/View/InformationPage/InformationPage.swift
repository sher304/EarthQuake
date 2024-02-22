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
                            properties: Properties(mag: 4.2, place: "s", time: 123, updated: 3, url: "Asd", detail: "s", magType: "mww", title: "3"),
                            geometry: Geometry(
                                coordinates: [145.0291, 42.4398, 35.463]
                            ),
                            id: "us7000ltaz"
                        )
                       
        )
}
