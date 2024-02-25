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
                
                if viewModel.isBigAmount {
                    VStack {
                        Text("Please reduce the search")
                            .fontWeight(.semibold)
                            .font(.title)
                        withAnimation {
                            FilterView(hideParentView: {
                                self.showFilter = false
                            }, viewModel: self.viewModel)
                        }
                    }
                }
                
                ScrollViewReader { reader in
                    ScrollView {
                        LazyVStack {
                            // MARK: Cell
                            ForEach(viewModel.features, id: \.id) { feature in
                                NavigationLink {
                                    MapInformationPage(feature: feature)
                                } label: {
                                    VStack {
                                        EarthquakeCell(feature: feature)
                                            .background(Color("WhiteToBlack"))
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                            .padding(.horizontal)
                                            .foregroundColor(.black)
                                        Divider()
                                            .padding(.horizontal)
                                    }
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
            // Navigation Title
            .navigationTitle("Earthquakes")
            .navigationBarTitleDisplayMode(.inline)
        }
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
