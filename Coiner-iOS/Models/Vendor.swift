//
//  Vendor.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import CoreLocation

struct Vendor: Equatable {
    
    var uniqueID: String
    var name: String
    var coordinates: CLLocationCoordinate2D
    var imageID: String
//    var joinedDate: Date
//    var addresss: Address
}
