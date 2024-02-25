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
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.isRotateEnabled = false
        return mapView
    }
    
    // MARK: Update View
    func updateUIView(_ mapView: MKMapView, context: Context) {
        if let selectedLocation = selectedLocation {
            let region = MKCoordinateRegion(center: selectedLocation, span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
            mapView.setRegion(region, animated: true)
            context.coordinator.addSelectAnnotation(coordinate: selectedLocation)
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
        
        // MARK: Init
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        // MARK: Select Annotatiton
        func addSelectAnnotation(coordinate: CLLocationCoordinate2D) {
            let customAnnotation = CustomCircleAnnotation(annotation: nil, reuseIdentifier: "CustomAnnotation")

            let annotationPoint = MKPointAnnotation()
            annotationPoint.coordinate = coordinate
            parent.mapView.addAnnotation(annotationPoint)
            parent.mapView.selectAnnotation(annotationPoint, animated: true)
        }
        
        // MARK: Adding Custom Annotation View.
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard annotation is MKPointAnnotation else { return nil }
            
            let annotationView = CustomCircleAnnotation(annotation: annotation, reuseIdentifier: "CustomAnnotation")
            annotationView.canShowCallout = true
            return annotationView
        }
    }
}
