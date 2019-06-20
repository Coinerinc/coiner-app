//
//  VendorInformationTableViewCell.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit

class VendorImageTableViewCell: UITableViewCell {
    
    var vendor: Vendor? {
        didSet {
            configureVendorInformationCell()
        }
    }
    @IBOutlet weak var vendorImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func configureVendorInformationCell() {
        activityIndicator.startAnimating()
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        // MARK Make Network Call to fetch Image from vendor image ID
        if let vendor = vendor {
            TemporaryImageNetworkCalls.fetchVendorImageFromWebsite(withVendorImageID: vendor.imageID) { (image) in
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.vendorImageView.image = image
                }
            }
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
