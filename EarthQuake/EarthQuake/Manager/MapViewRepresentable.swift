//
//  MapViewRepresentable.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 7/2/24.
//

import MapKit
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("UPDATE UI VIEw")
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}


// MARK: MapCoordinator
extension MapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: Properties
        let parent: MapViewRepresentable
        var currentRegion: MKCoordinateRegion?
        var userLocationCoordinate: CLLocationCoordinate2D?
        
        
        // MARK: Init
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: didUpdate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center:
                    CLLocationCoordinate2D(
                        latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.currentRegion = region
            parent.mapView.setRegion(region, animated: true)
        }
        
    }
}
