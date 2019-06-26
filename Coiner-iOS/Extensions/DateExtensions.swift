//
//  DateExtensions.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/21/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation

extension Date {
    func formattedToString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
