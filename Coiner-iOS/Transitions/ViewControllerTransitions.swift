//
//  ViewControllerTransitions.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllerTransitions {
    static func presentPopOverViewController(withParentViewController parentViewController: UIViewController, withStoryboardName storyboardName: String, withIdentifier identifier: String, withDimView dimView: UIView) {
        let childVC = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
        childVC.modalPresentationStyle = .fullScreen
        UIView.animate(withDuration: 0.1) {
            dimView.alpha = 0.6
        }
        parentViewController.present(childVC, animated: true)
    }
    
    
}
