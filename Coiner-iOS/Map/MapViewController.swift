//
//  ViewController.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/18/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    var masterViewController: DirectoryViewController?
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    var zoomLevel: Float = 12.0
    var vendors = TemporaryVendors.vendors
    var selectedVendor: Vendor?
    var transactionsAtSelectedVendor = [Transaction]() 
    
    var coinerTapGesture = UITapGestureRecognizer()
    var drawerTapGesture = UITapGestureRecognizer()
    var navigatorTapGesture = UITapGestureRecognizer()
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var coinerView: RoundedView!
    @IBOutlet weak var navigatorView: RoundedImageView!
    @IBOutlet weak var navigatorIconImageView: UIImageView!
    @IBOutlet weak var coinerLogoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocationManagerAndMapView()
        initializeMarkers()
        setUpCoinerTapGesture()
        setUpNavigatorTapGesture()
        // Do any additional setup after loading the view.
    }


}

