//
//  MapViewTableViewExtension.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension MapViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setUpTableView() {
        selectedVendorTableView.contentInset = UIEdgeInsets(top: self.view.bounds.height * 0.9, left: 0, bottom: 0, right: 0)
    }
    func presentTableView(forSelectedVendor selectedVendor: Vendor) {
        selectedVendorTableView.contentInset = UIEdgeInsets(top: self.view.bounds.height * 0.50, left: 0, bottom: 0, right: 0)
        TemporaryTransactions.initializeTemporaryTransctions(vendor: selectedVendor) { (vendorTransactions) in
            self.transactionsAtSelectedVendor = vendorTransactions
            self.selectedVendorTableView.reloadData()
        }
    }
    func hideTableView() {
        selectedVendorTableView.contentInset = UIEdgeInsets(top: self.view.bounds.height * 0.9, left: 0, bottom: 0, right: 0)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if selectedVendor != nil {
                return 1
            } else {
                return 0
            }
        case 1:
            if selectedVendor != nil {
                return 1
            } else {
                return 0
            }
        case 2:
            return transactionsAtSelectedVendor.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let vendorImageCell = tableView.dequeueReusableCell(withIdentifier: "VendorImageCell", for: indexPath) as! VendorImageTableViewCell
            vendorImageCell.vendor = selectedVendor
            return vendorImageCell
        case 1:
            let vendorInformationCell = tableView.dequeueReusableCell(withIdentifier: "VendorInformationCell", for: indexPath) as! VendorInformationTableViewCell
            vendorInformationCell.vendor = selectedVendor
            return vendorInformationCell
        case 2:
            let transactionCell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
            transactionCell.transaction = transactionsAtSelectedVendor[indexPath.row]
            return transactionCell
        default:
            return UITableViewCell()
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.view.frame.height * 0.25
        case 1:
            return self.view.frame.height * 0.15
        case 2:
            return self.view.frame.height * 0.15
        default:
            return self.view.frame.height * 0.15
        }
    }
}
