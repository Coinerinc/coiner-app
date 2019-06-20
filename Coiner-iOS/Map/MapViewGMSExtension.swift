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
        hideTableView()
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
        presentTableView(forSelectedVendor: selectedVendor!)
    }
    
    // MARK: Location Manager Error Handling
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
           displayDefaultLocationForMapView()
            Alerts.presentErrorAlert(presentingViewController: self, withTitle: "Location Services Error", withMessage: "Your location access was restricted. Please check your settings to allow location services for Coiner.", defaultActionTitle: "Dismiss")
        case .denied:
            displayDefaultLocationForMapView()
             Alerts.presentErrorAlert(presentingViewController: self, withTitle: "Location Services Error", withMessage: "You have denied Coiner's access to your location services. Please check your settings to allow location services for Coiner.", defaultActionTitle: "Dismiss")
        case .notDetermined:
            displayDefaultLocationForMapView()
            Alerts.presentErrorAlert(presentingViewController: self, withTitle: "Location Services Error", withMessage: "Coiner is unable to check the status of your location.", defaultActionTitle: "Dismiss")
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
        Alerts.presentErrorAlert(presentingViewController: self, withTitle: "Location Services Error", withMessage: "We apologize for the inconvenience, but there seems to be an issue with your location services. Please restart the app to fix this issue. \n\n \(error.localizedDescription)", defaultActionTitle: "Okay")
    }
    
    
    func displayDefaultLocationForMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 40.759211, longitude: -73.984638, zoom: zoomLevel)
        mapView?.animate(to: camera)
    }
    

}


