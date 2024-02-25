//
//  InformationPage.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI
import MapKit

struct MapInformationPage: View {
    
    var feature: Feature
    @State private var selectedLocation: CLLocationCoordinate2D?
    
    // MARK: View
    var body: some View {
        ZStack {
            MapViewRepresentable(selectedLocation: $selectedLocation)
            VStack {
                 Spacer()
                Link(destination: URL(string: feature.properties.url) ?? .homeDirectory) {
                    EarthquakeCell(feature: feature)
                        .background(Color("WhiteToBlack"))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .shadow(radius: 9)
                }
             }
            .padding(.bottom, 40)
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            setLocation()
        })
    }
    
    
    // MARK: Set Location
    private func setLocation() {
        let coordinates = self.feature.geometry.coordinates
        let longitude = coordinates[0]
        let latitude = coordinates[1]
        self.selectedLocation = CLLocationCoordinate2D(latitude: latitude,
                                                       longitude: longitude)
    }
}

#Preview {
    MapInformationPage(feature:
                        Feature(
                            properties: Properties(mag: 4.2, place: "s", time: 123, updated: 3, url: "Asd", detail: "s", magType: "mww", title: "3"),
                            geometry: Geometry(
                                coordinates: [145.0291, 42.4398, 35.463]
                            ),
                            id: "us7000ltaz"
                        )
    )
}
