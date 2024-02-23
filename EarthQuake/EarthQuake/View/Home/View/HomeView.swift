//
//  HomeView.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var scrollToTop = false
    @State private var showFilter = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isEmpty {
                    Text("Nothing new...")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                ScrollViewReader { reader in
                    ScrollView {
                        LazyVStack {
                            // MARK: Cell
                            ForEach(viewModel.features, id: \.id) { feature in
                                NavigationLink {
                                    InformationPage(feature: feature)
                                        .id(feature.id)
                                } label: {
                                    EarthquakeCell(feature: feature)
                                        .background(Color("WhiteToBlack"))
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                        .padding(.horizontal)
                                        .foregroundColor(.black)
                                }
                            }
                        }.disabled(showFilter)
                    }
                    .environment(\.isScrollEnabled, !showFilter)
                    
                    // MARK: Tool Bar
                    .toolbar {
                        // MARK: "Filter Button"
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.showFilter.toggle()
                            } label: {
                                Image(systemName: "calendar.day.timeline.left")
                            }
                            
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            // MARK: "Refresh Button"
                            Button {
                                viewModel.getLatestAccidents()
                                scrollToTop = true
                                withAnimation {
                                    reader.scrollTo(viewModel.features.first?.id ?? "", anchor: .top)
                                }
                            } label: {
                                Image(systemName: "arrow.clockwise")
                            }
                        }
                    }
                }
                
                // MARK: Loading View
                if viewModel.isLoading {
                    LoadingView() }
                
                // MARK: Filter View
                if showFilter {
                    withAnimation {
                        FilterView(hideParentView: {
                            self.showFilter = false
                        }, viewModel: self.viewModel)
                    }
                }
            }
            // Background Color
//            .background(Color("HomeBackground"))
            .background(Color("WhiteToBlack"))
            // Navigation Title
            .navigationTitle("Earthquakes")
            .navigationBarTitleDisplayMode(.large)
        }
//        .navigationBarColor(.clear)
        .foregroundStyle(Color("BlackToWhite"))
        .onAppear {
            viewModel.getLatestAccidents()
        }
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
