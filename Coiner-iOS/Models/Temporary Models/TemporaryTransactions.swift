//
//  TemporaryTransactions.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation

struct TemporaryTransactions {
    
    static func initializeTemporaryTransctions(vendor: Vendor, completion: @escaping (_: [Transaction]) -> ()) {
        let transaction1 = Transaction(uniqueID: "1", amount: 0.12, date: Date(), vendor: vendor)
        let transaction2 = Transaction(uniqueID: "2", amount: 0.99, date: Date(), vendor: vendor)
        let transaction3 = Transaction(uniqueID: "3", amount: 0.67, date: Date(), vendor: vendor)
        let transaction4 = Transaction(uniqueID: "4", amount: 0.25, date: Date(), vendor: vendor)
        let transaction5 = Transaction(uniqueID: "5", amount: 0.10, date: Date(), vendor: vendor)
        let transaction6 = Transaction(uniqueID: "6", amount: 0.1, date: Date(), vendor: vendor)
        let transaction7 = Transaction(uniqueID: "7", amount: 0.5, date: Date(), vendor: vendor)
        let transaction8 = Transaction(uniqueID: "8", amount: 0.50, date: Date(), vendor: vendor)
        let transaction9 = Transaction(uniqueID: "9", amount: 0.75, date: Date(), vendor: vendor)
        let transaction10 = Transaction(uniqueID: "10", amount: 0.89, date: Date(), vendor: vendor)
        let transactions = [transaction1, transaction2, transaction3, transaction4, transaction5, transaction6, transaction7, transaction8, transaction9, transaction10]
        completion(transactions)
    }
 
}
