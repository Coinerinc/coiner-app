//
//  UIViewAnimations.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func rotate(numberOfRotations: Int) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.duration = 1
        rotateAnimation.repeatCount = Float(numberOfRotations)
        
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
