//
//  EarthquakeCell.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct EarthquakeCell: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "water.waves")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.red)
                .frame(width: 30, height: 30)
                .padding(.top)
            
            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("22 km from your position")
                        .fontWeight(.semibold)
                    Text("Almaty, Kazakhstan")
                        .foregroundStyle(.gray)
                    Text("41 min ago, 3:30 AM")
                        .foregroundStyle(.gray)
                }
                
                VStack {
                    Text("5.1")
                        .font(.system(size: 75))
                        .fontWeight(.semibold)
                    Text("Magnitude")
                }
                
                VStack(spacing: 0) {
                    Image(systemName: "ipodshuffle.gen3")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .background(.red)
                    Image(systemName: "ipodshuffle.gen3")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .background(.orange)
                    Image(systemName: "ipodshuffle.gen3")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .background(.green)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 10)
    }
}

#Preview {
    EarthquakeCell()
}
