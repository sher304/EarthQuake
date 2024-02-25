//
//  RectangleStack.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 25/2/24.
//

import SwiftUI

struct RectangleStack: View {
    let magnitude: Double
    
    var body: some View {
        let colors: [Color]
        switch magnitude {
        case 1..<2:
            colors = [.green]
        case 2...4:
            colors = [.yellow, .green]
        case 5..<6:
            colors = [.orange, .yellow, .green]
        case 6..<8:
            colors = [Color(red: 1, green: 0.5, blue: 0), .orange, .yellow, .green]
        case 8...10:
            colors = [.red, Color(red: 1, green: 0.5, blue: 0), .orange, .yellow, .green]
        default:
            colors = []
        }
        
        return VStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color)
                    .frame(width: 10, height: 30)
            }
        }
    }
}
