//
//  Alerts.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

struct Alerts {
    static func presentBiOptionAlert(presentingViewController viewController: UIViewController, withTitle title: String, withMessage message: String, defaultActionTitle: String, destructiveActionTitle: String, withCompletion completionFunction: ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionTitle, style: .default) { (completion) in
            completionFunction
        }
        let destructiveAction = UIAlertAction(title: destructiveActionTitle, style: .destructive, handler: nil)
        alertController.view.tintColor = #colorLiteral(red: 0.06169537455, green: 0.01816294342, blue: 0.8379738927, alpha: 1)
        alertController.addAction(defaultAction)
        alertController.addAction(destructiveAction)
        viewController.present(alertController, animated: true)
    }
    
    static func presentErrorAlert(presentingViewController viewController: UIViewController, withTitle title: String, withMessage message: String, defaultActionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionTitle, style: .default, handler: nil)
        alertController.view.tintColor = #colorLiteral(red: 0.06169537455, green: 0.01816294342, blue: 0.8379738927, alpha: 1)
        alertController.addAction(defaultAction)
        viewController.present(alertController, animated: true)
    }
}
