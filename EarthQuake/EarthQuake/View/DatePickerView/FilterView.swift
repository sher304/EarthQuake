//
//  DatePicker.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 19/2/24.
//

import SwiftUI

struct FilterView: View {
    var hideParentView: () -> Void
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // MARK: Informatiop Page Start
            VStack {
                // Date
                HStack {
                    VStack {
                        Text("From")
                            .fontWeight(.semibold)
                        DatePicker("", selection: $viewModel.startDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                    VStack {
                        Text("To")
                            .fontWeight(.semibold)
                        DatePicker("", selection: $viewModel.endDate, in: ...Date.now, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                }
                .foregroundStyle(Color("BlackToWhite"))
                
                // Magnitude Change
                HStack {
                    Text("Minimum magnitude: \($viewModel.magnitude.wrappedValue)")
                        .fontWeight(.semibold)
                    Stepper(value: $viewModel.magnitude, in: 0...9) {}
                    .labelsHidden()
                }
                .padding(.top)
                
                // Save button
                Button {
                    viewModel.updateFilter()
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
            .background(Color("WhiteToBlack"))
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
