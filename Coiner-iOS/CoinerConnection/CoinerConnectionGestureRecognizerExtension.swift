//
//  CoinerConnectionGestureRecognizerExtension.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension CoinerConnectionViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func dismissView() {
        self.dismiss(animated: true) {
            UIView.animate(withDuration: 0.1, animations: {
                if let masterViewController = self.masterViewController {
                    masterViewController.dimView.alpha = 0
                }
            })
        }
    }
    
    func setUpPanGesture() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(CoinerConnectionViewController.panGestureToDismissView(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer!)
    }
    
    @objc func panGestureToDismissView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            originalPosition = view.center
            currentPositionTouched = sender.location(in: view)
        } else if sender.state == .changed && translation.y > 0 {
            view.frame.origin = CGPoint(
                x: 0,
                y: translation.y
            )
        } else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            
            if velocity.y >= 1500 {
                UIView.animate(withDuration: 0.1
                    , animations: {
                        self.view.frame.origin = CGPoint(
                            x: self.view.frame.origin.x,
                            y: self.view.frame.size.height
                        )
                }, completion: { (isCompleted) in
                    if isCompleted {
                        self.dismissView()
                    }
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.center = self.originalPosition!
                })
            }
        }
    }
}
