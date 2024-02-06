//
//  HomeView.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Properties
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<20, id: \.self) { element in
                        EarthquakeCell()
                            .background(.white)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 8))
                        Divider()
                    }
                }
                .padding()
                .background(.pink)
            }
            
            .navigationTitle("Earchquakes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(.black)
                }
                .padding(.trailing, 8)
            })
        }
    }
}

#Preview {
    HomeView()
}
