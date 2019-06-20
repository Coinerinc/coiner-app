//
//  User.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/18/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation

struct User {
    var uniqueID: String
    var phoneNumber: Int
    var email: String
    var name: String
    var imageID: String
    var joinedDate: Date
    var favorites: [Vendor]
    var transactions: [Transaction]
    var rewards: [Reward]
}
