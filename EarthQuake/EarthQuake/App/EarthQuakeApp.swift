//
//  EarthQuakeApp.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI

@main
struct EarthQuakeApp: App {
    
    
    @StateObject var homeViewModel: HomeViewModel
    
    init() {
        let earthquakeServiceImpl = EarthquakeServiceImpl(networkService: NetworkService<EarthquakeEndPoint>())
           self._homeViewModel = StateObject(wrappedValue: HomeViewModel(earthquakeService: earthquakeServiceImpl))
       }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
