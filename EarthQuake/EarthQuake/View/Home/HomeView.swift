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
                        NavigationLink {
                            InformationPage()
                        } label: {
                            EarthquakeCell()
                                .tint(.black)
                                .background(.white)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 6))
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
                .background(Color("HomeBackground"))
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
