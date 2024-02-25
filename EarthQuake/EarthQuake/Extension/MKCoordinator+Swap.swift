//
//  MKCoordinator+Swap.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 25/2/24.
//

import MapKit

extension MKCoordinateRegion {
    var isBeingInteracted: Bool {
        return abs(span.latitudeDelta - 0.05) > .ulpOfOne || abs(span.longitudeDelta - 0.05) > .ulpOfOne
    }
}
