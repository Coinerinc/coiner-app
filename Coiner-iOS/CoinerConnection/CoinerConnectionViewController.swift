//
//  CoinerConnectionViewController.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit

class CoinerConnectionViewController: UIViewController {
    
    var masterViewController: DirectoryViewController?
    
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    var panGestureRecognizer: UIPanGestureRecognizer?
    var isCurrentlyLoggedIn = false

    @IBOutlet weak var blurredView: UIView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPanGesture()
        setUpBlurredView()
        setUpViewComponents()

        // Do any additional setup after loading the view.
    }
    

    func setUpBlurredView() {
        blurredView.addBlurredEffect()

    }
    
    func checkForCurrentUser() {
        if currentUser != nil {
            isCurrentlyLoggedIn = true
        } else {
            isCurrentlyLoggedIn = false
        }
    }
    
    func setUpViewComponents() {
        checkForCurrentUser()
        switch isCurrentlyLoggedIn {
        case true:
            print("TODO: Present Coiner Sync Components")
        case false:
            print("TODO: Present Requred Log in/ SignUp Components")
        }
    }

}
