//
//  DirectoryAnimations.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension DirectoryViewController {
    func showDrawer() {
        UIView.animate(withDuration: 0.5) {
            self.drawerScrollView.contentOffset = CGPoint.zero
        }
    }
    
    func hideDrawer() {
        UIView.animate(withDuration: 0.5) {
            self.drawerScrollView.contentOffset = CGPoint(x: self.view.frame.width * 0.75, y: 0)
        }
    }
    
    func handlePanGesture() {
        
    }
}
