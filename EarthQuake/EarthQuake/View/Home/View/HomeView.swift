//
//  HomeView.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
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
            viewModel.getLatestAccidents()
        })
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                viewModel.userLocation = location
            }
        }
    }
}

#Preview {
    HomeView()
}
