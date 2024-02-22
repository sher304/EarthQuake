//
//  DatePicker.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 19/2/24.
//

import SwiftUI

struct FilterView: View {
    var hideParentView: () -> Void
    var viewModel: HomeViewModel
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var magnitude = 5
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // MARK: Informatiop Page Start
            VStack {
                // Date
                HStack {
                    VStack {
                        Text("From")
                            .fontWeight(.semibold)
                        DatePicker("", selection: $startDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                    VStack {
                        Text("To")
                            .fontWeight(.semibold)
                        DatePicker("", selection: $endDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                }
                
                // Magnitude Change
                HStack {
                    Text("Minimum magnitude: \(magnitude)")
                        .fontWeight(.semibold)
                    Stepper(value: $magnitude, in: 0...8) {}
                    .labelsHidden()
                }
                .padding(.top)
                
                // Save button
                Button {
                    viewModel.updateFilter(startDate: startDate,
                                           endDate: endDate,
                                           magnitude: magnitude)
                    self.hideParentView()
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 40)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            // Costomize information page
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 17))
            .shadow(radius: 10)
            
            // MARK: Informatiop Page End
        }
        .padding(5)
    }
}
//
//#Preview {
//    FilterView()
//}
