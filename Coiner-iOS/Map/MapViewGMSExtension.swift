//
//  MapViewGMSExtension.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/18/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces
import GoogleMaps

extension MapViewController: GMSMapViewDelegate, CLLocationManagerDelegate {
    func setUpLocationManagerAndMapView() {
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.zoomGestures = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    }
    
    func initializeMarkers() {
        for vendor in  vendors {
            setUpLocationMarker(atLatitude: vendor.coordinates.latitude, atLongitude: vendor.coordinates.longitude)
        }
    }
    
    func setUpLocationMarker(atLatitude latitude: CLLocationDegrees, atLongitude longitude: CLLocationDegrees ) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.icon = GMSMarker.markerImage(with: #colorLiteral(red: 0.06169537455, green: 0.01816294342, blue: 0.8379738927, alpha: 1))
        marker.map = mapView
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        mapView?.animate(to: camera)
        currentLocation = location.coordinate
        locationManager.stopUpdatingLocation()
    }
    

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        masterViewController?.hideDrawer()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        handleDidTapMarker(marker: marker)
        return true
    }
    
    func handleDidTapMarker(marker: GMSMarker) {
        let camera = GMSCameraPosition.camera(withLatitude: marker.position.latitude, longitude: marker.position.longitude, zoom: (mapView?.camera.zoom ?? zoomLevel))
        self.mapView?.animate(to: camera)
        selectedVendor = vendors.filter {$0.coordinates == marker.position}[0]
        if let transactions = currentUser?.transactions, let selectedVendor = selectedVendor {
            transactionsAtSelectedVendor = transactions.filter({$0.vendor == selectedVendor})
        }
    }
    
    // MARK: Location Manager Error Handling
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("TODO: Add Error Alerts")
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
            // Display the map using the default location.
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        @unknown default:
            print("@unknown default error in didChangeAuthorization")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
        print("TODO: Alert Error")
    }
    

}


