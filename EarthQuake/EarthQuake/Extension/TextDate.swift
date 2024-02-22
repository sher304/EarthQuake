//
//  Text+ConvertDate.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 10/2/24.
//

import SwiftUI

extension Text {
    
    public func convertDate(date: Int) -> Text {
        let date = Date(timeIntervalSince1970: TimeInterval(date) / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, HH:mm yyyy"
        return Text(dateFormatter.string(from: date))
    }
}
