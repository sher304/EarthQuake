//
//  InformationPage.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 6/2/24.
//

import SwiftUI
import MapKit

struct InformationPage: View {
    
    // MARK: View
    var body: some View {
        ZStack {
            MapViewRepresentable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    InformationPage()
}
