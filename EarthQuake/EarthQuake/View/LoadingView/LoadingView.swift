//
//  LoadingView.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 15/2/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color("HomeBackground").ignoresSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
                .tint(.gray)
        }
    }
}

#Preview {
    LoadingView()
}
