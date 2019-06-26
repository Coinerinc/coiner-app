//
//  DoubleExtensions.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/21/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation

extension Double {
    func formatToCurrencyString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.roundingMode = .up
        return "$" + numberFormatter.string(from: NSNumber(value:self))!
    }
}
