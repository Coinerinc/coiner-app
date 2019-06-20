//
//  Transaction.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation

struct Transaction {
    var uniqueID: String
    var amount: Double
    var date: Date
    var vendor: Vendor
}
