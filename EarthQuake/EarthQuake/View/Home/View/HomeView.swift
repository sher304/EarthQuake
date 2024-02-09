//
//  HomeView.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Properties
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: View
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack {
                    ForEach(viewModel.features, id: \.id) { feature in
                        NavigationLink {
                            InformationPage(feature: feature)
                        } label: {
                            EarthquakeCell(feature: feature)
                                .tint(.black)
                                .background(.white)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 6))
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.top)
            .background(Color("HomeBackground"))
            
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
            .toolbarBackground(.visible, for: .navigationBar)
        }.onAppear(perform: {
            viewModel.getAccidents()
        })
        .onReceive(LocationManager.shared.$userCurrentLocation, perform: { userLocation in
            if let userLocation = userLocation {
                viewModel.userLocation = userLocation
            }
        })
    }
}

#Preview {
    HomeView()
}
