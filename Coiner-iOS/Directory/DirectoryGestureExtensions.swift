//
//  DirectoryTapGestureExtensions.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension DirectoryViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
//     Drawer Tap Gesture
        func setUpDrawerTapGesture() {
            drawerTapGesture = UITapGestureRecognizer(target: self, action: #selector(DirectoryViewController.handleDrawerTapGesture(_:)))
            drawerTapGesture.delegate = self 
            drawerIconView.addGestureRecognizer(drawerTapGesture)
        }
    
        @objc func handleDrawerTapGesture(_ sender: UITapGestureRecognizer) {
            showDrawer()
        }
    
//     Edge Pan Gesture
    func setUpEdgePanGesture() {
        panGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(DirectoryViewController.handleEdgePanGesture(_:)))
        panGesture.edges = .left
        panGesture.delegate = self
        self.view.addGestureRecognizer(panGesture)
    }
    
    @objc func handleEdgePanGesture(_ sender: UIPanGestureRecognizer) {
        showDrawer()
    }
    
    

    // Tap To dismiss Drawer Gesture?
    
    
}
