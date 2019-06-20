//
//  VendorHeaderTableViewCell.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit

class VendorInformationTableViewCell: UITableViewCell {
    
    var vendor: Vendor? {
        didSet{
            configureVendorHeaderCell()
        }
    }
    var isFavorited = false
    
    @IBOutlet weak var vendorNameLabel: UILabel!
    @IBOutlet weak var vendorAddressLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        print("TODO: Handle Did Tap Favorite Button")
    }
    
    
    func configureVendorHeaderCell() {
        if let vendor = vendor {
            //MARK: Check is location is favorited
            vendorNameLabel.text = vendor.name
            vendorAddressLabel.text = "\(vendor.coordinates.latitude) \(vendor.coordinates.longitude)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
