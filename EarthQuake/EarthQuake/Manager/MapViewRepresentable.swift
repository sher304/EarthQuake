//
//  MapViewRepresentable.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 7/2/24.
//

import MapKit
import SwiftUI

struct MapViewRepresentable: UIViewRepresentable {
    
    // MARK: Properties
    let mapView = MKMapView()
    @Binding var selectedLocation: CLLocationCoordinate2D?
    
    // MARK: Make View
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.isRotateEnabled = false
        return mapView
    }
    
    // MARK: Update View
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedLocation = selectedLocation {
            context.coordinator.addSelectAnnotation(coordinate: selectedLocation)
            let region = MKCoordinateRegion(
                center: selectedLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
        }
    }
    
    // MARK: Make Coordinator
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}


// MARK: MapCoordinator
extension MapViewRepresentable {
    
    // MARK: MapCoordinator
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: Properties
        let parent: MapViewRepresentable
        var currentRegion: MKCoordinateRegion?
        
        
        // MARK: Init
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: didUpdate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let selectedLocation = parent.selectedLocation
            let region = MKCoordinateRegion(
                center:
                    CLLocationCoordinate2D(
                        latitude: selectedLocation?.latitude ?? 0,
                        longitude: selectedLocation?.longitude ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.currentRegion = region
            parent.mapView.setRegion(region, animated: true)
        }
        
        
        // MARK: Select Annotatiton
        func addSelectAnnotation(coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            self.parent.mapView.addAnnotation(annotation)
            self.parent.mapView.selectAnnotation(annotation, animated: true)
        }
    }
}
