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
                .padding(.trailing, 10)
                
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    
    EarthquakeCell(feature:
                    Feature(
                        type: FeatureType(rawValue: "Feature")!,
                        properties: Properties(
                            mag: 5.19,
                            place: "622222 km SSE of Akkeshi, Japan",
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
