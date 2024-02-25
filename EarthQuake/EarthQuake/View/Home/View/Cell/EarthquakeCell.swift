//
//  EarthquakeCell.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct EarthquakeCell: View {
    // MARK: Properties
    
    var feature: Feature
    @EnvironmentObject private var viewModel: HomeViewModel
    
    // MARK: View
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "water.waves")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.red)
                .frame(width: 30, height: 30)
                .padding(.top)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(
                        "\(viewModel.calculateDistance(latitude: feature.geometry.coordinates[1], longitude: feature.geometry.coordinates[0]).description) km away from your position")
                    .multilineTextAlignment(.leading)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("BlackToWhite"))
                    Text(feature.properties.place)
                        .font(.caption)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                    Text("")
                        .convertDate(date: feature.properties.time)
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
                
                VStack {
                    Text(feature.properties.mag.description)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Magnitude")
                }
                .foregroundStyle(Color("BlackToWhite"))
                .padding(.trailing, 10)
                
            }
            Divider()
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    
    EarthquakeCell(feature:
                    Feature(
                        properties: Properties(mag: 4.2, place: "s", time: 123, updated: 3, url: "Asd", detail: "s", magType: "mww", title: "3"),
                        geometry: Geometry(
                            coordinates: [145.0291, 42.4398, 35.463]
                        ),
                        id: "us7000ltaz"
                    )
                   
    )
    
}
