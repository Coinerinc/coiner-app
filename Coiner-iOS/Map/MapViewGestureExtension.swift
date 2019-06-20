//
//  MapViewTapGestureExtension.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import GooglePlaces

extension MapViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    // Coiner Tap Gesture
    func setUpCoinerTapGesture() {
        coinerTapGesture = UITapGestureRecognizer(target: self, action: #selector(MapViewController.handleCoinerTapGesture(_:)))
        coinerTapGesture.delegate = self
        coinerView.addGestureRecognizer(coinerTapGesture)
        
    }
    @objc func handleCoinerTapGesture(_ sender: UITapGestureRecognizer) {
        print("TODO: Coiner Tap Gesture")
        // MARK: Instantiate PopOver Presentation
    }
    

    // Navigator Tap Gesture
    func setUpNavigatorTapGesture() {
        navigatorTapGesture = UITapGestureRecognizer(target: self, action: #selector(MapViewController.handleNavigatorTapGesture(_:)))
        navigatorTapGesture.delegate = self 
        navigatorView.addGestureRecognizer(navigatorTapGesture)
        
    }
    
    @objc func handleNavigatorTapGesture(_ sender: UITapGestureRecognizer) {
        navigatorIconImageView.rotate(numberOfRotations: 1)
        if let currentLocation = currentLocation {
            let camera = GMSCameraPosition.camera(withLatitude: currentLocation.latitude, longitude: currentLocation.longitude, zoom: zoomLevel)
            mapView?.animate(to: camera)
        }
    }
}
