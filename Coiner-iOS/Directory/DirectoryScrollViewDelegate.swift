//
//  DirectoryScrollViewDelegate.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import Foundation
import UIKit

extension DirectoryViewController: UIScrollViewDelegate {

    func configureDrawerComponents() {
        checkForCurrentUser()
        switch isCurrentlyLoggedIn {
        case false:
            welcomeLabel.isHidden = false
            currentUserView.isHidden = true
            profileStackView.isHidden = true
            transactionsStackView.isHidden = true
            rewardsStackView.isHidden = true
            walletStackView.isHidden = true
            logOut_signInButton.setTitle("Log In/Sign Up", for: .normal)
            logOut_signInButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            logOut_signInButton.backgroundColor = #colorLiteral(red: 0.06145214289, green: 0.01831493899, blue: 0.8379225731, alpha: 1)
        case true:
            welcomeLabel.isHidden = true 
            currentUserView.isHidden = false
            profileStackView.isHidden = false
            transactionsStackView.isHidden = false
            rewardsStackView.isHidden = false
            walletStackView.isHidden = false
            logOut_signInButton.setTitle("Log Out", for: .normal)
            logOut_signInButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            logOut_signInButton.backgroundColor = .white
        }
    }
    
    func setUpDrawerScrollView() {
        drawerScrollView.contentOffset = CGPoint(x: self.view.frame.width * 0.75, y: 0)
        drawerScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.view.frame.width * 0.75)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.tag == 1 {
            let initialOffset = self.view.bounds.width * 0.75
            let percentMoved = ((initialOffset - scrollView.contentOffset.x) / initialOffset)
            self.dimView.alpha = 0.6 * percentMoved
        } 
    }
}

