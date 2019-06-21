//
//  TemporaryImageNetoworkCalls.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

struct TemporaryImageNetworkCalls {
    
    static let myWebsiteURL = "https://justinfurstoss.com/"
    static func fetchVendorImageFromWebsite(withVendorImageID vendorImageID: String, completion: @escaping (_: UIImage) ->()) {
        let specificImageURL = myWebsiteURL + vendorImageID + ".jpg"
        if let url = URL(string: specificImageURL) {
            var fetchedIconData = Data()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    fetchedIconData = data
                } else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
                completion(UIImage(data: fetchedIconData) ?? UIImage())
            }
            task.resume()
        }
    }
    
    static func fetchProfileImageFromWebsite(withProfileImageID profileImageID: String, completion: @escaping (_: UIImage) ->()) {
        let specificImageURL = myWebsiteURL + profileImageID.uppercased() + ".png"
        if let url = URL(string: specificImageURL) {
            var fetchedIconData = Data()
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    fetchedIconData = data
                } else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
                completion(UIImage(data: fetchedIconData) ?? UIImage())
            }
            task.resume()
        }
    }
}
