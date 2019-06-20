//
//  DirectoryViewController.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/19/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit


enum VCIndices : Int {
    case mapVC = 0
    case transactionsVC = 1
    case rewardsVC = 2
    case walletVC = 3
    case aboutCoinerVC = 4
}

class DirectoryViewController: UIViewController {
    
    var isCurrentlyLoggedIn = false
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var drawerIconView: RoundedImageView!
    @IBOutlet weak var drawerScrollView: UIScrollView!
    
    @IBOutlet weak var currentUserView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var profileImageView: RoundedImageView!
    @IBOutlet weak var usernameTextField: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var transactionsStackView: UIStackView!
    @IBOutlet weak var rewardsStackView: UIStackView!
    @IBOutlet weak var walletStackView: UIStackView!
    @IBOutlet weak var aboutStackView: UIStackView!
    @IBOutlet weak var logOut_signInButton: UIButton!
    
    @IBAction func didTapProfileButton(_ sender: UIButton) {
        print("TODO: Instantiate Profile Pop Over")
        hideDrawer()
    }
    @IBAction func didTapMainButton(_ sender: UIButton) {
        displayCurrentTab(VCIndices.mapVC.rawValue)
        hideDrawer()
    }
    @IBAction func didTapTransactionsButton(_ sender: UIButton) {
        displayCurrentTab(VCIndices.transactionsVC.rawValue)
        hideDrawer()
    }
    @IBAction func didTapRewardsButton(_ sender: UIButton) {
        displayCurrentTab(VCIndices.rewardsVC.rawValue)
        hideDrawer()
    }
    @IBAction func didTapWalletButton(_ sender: UIButton) {
        displayCurrentTab(VCIndices.walletVC.rawValue)
        hideDrawer()
    }
    
    @IBAction func didTapAboutCoinerButton(_ sender: UIButton) {
        displayCurrentTab(VCIndices.aboutCoinerVC.rawValue)
        hideDrawer()
    }
    @IBAction func didTapLogOut_SignInButton(_ sender: UIButton) {
        hideDrawer()
        switch isCurrentlyLoggedIn {
        case false :
            print("TODO: Instantiate Log In / Sign Up View Controller")
        case true :
            Alerts.presentBiOptionAlert(presentingViewController: self, withTitle: "Leaving Coiner?", withMessage: "Are you sure you wish to log out of your Coiner account?", defaultActionTitle: "Log Out", destructiveActionTitle: "Cancel", withCompletion: handleLogOut())
        }
    }
    
    
    var drawerTapGesture = UITapGestureRecognizer()
    
    var panGesture = UIScreenEdgePanGestureRecognizer()
    var currentViewController: UIViewController?
    
    lazy var mapViewController: UIViewController? = {
        let mapViewController = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "Map") as! MapViewController
        mapViewController.masterViewController = self
        return mapViewController
    }()
    lazy var transactionsViewController: UIViewController? = {
        let transactionsViewController = UIStoryboard(name: "Transactions", bundle: nil).instantiateViewController(withIdentifier: "Transactions") as! TransactionsViewController
        transactionsViewController.masterViewController = self
        return transactionsViewController
    }()
    lazy var rewardsViewController: UIViewController? = {
        let rewardsViewController = UIStoryboard(name: "Rewards", bundle: nil).instantiateViewController(withIdentifier: "Rewards") as! RewardsViewController
        rewardsViewController.masterViewController = self
        return rewardsViewController
    }()
    lazy var walletViewController: UIViewController? = {
        let walletViewController = UIStoryboard(name: "Wallet", bundle: nil).instantiateViewController(withIdentifier: "Wallet") as! WalletViewController
        walletViewController.masterViewController = self
        return walletViewController
    }()
    lazy var aboutCoinerViewController: UIViewController? = {
        let aboutCoinerViewController = UIStoryboard(name: "AboutCoiner", bundle: nil).instantiateViewController(withIdentifier: "AboutCoiner") as! AboutCoinerViewController
        aboutCoinerViewController.masterViewController = self
        return aboutCoinerViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentTab(VCIndices.mapVC.rawValue)
        setUpDrawerTapGesture()
        setUpEdgePanGesture()
        setUpDrawerScrollView()
        configureDrawerComponents()
        
    }
    
    func displayCurrentTab(_ vcIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(vcIndex) {

            self.addChild(vc)
            vc.didMove(toParent: self)
            
            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.currentViewController = vc
        }
    }
    
    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case VCIndices.mapVC.rawValue:
            vc = mapViewController
        case VCIndices.transactionsVC.rawValue:
            vc = transactionsViewController
        case VCIndices.rewardsVC.rawValue:
            vc = rewardsViewController
        case VCIndices.walletVC.rawValue:
            vc = walletViewController
        case VCIndices.aboutCoinerVC.rawValue:
            vc = aboutCoinerViewController
        default:
            return vc
        }
        return vc
    }
    
    func checkForCurrentUser() {
        if currentUser != nil {
            isCurrentlyLoggedIn = true
            usernameTextField.text = currentUser?.name
        } else {
            isCurrentlyLoggedIn = false 
        }
    }
    
    func handleLogOut() {
        print("TODO: Implement Handle Log Out Function")
        currentUser = nil
        configureDrawerComponents()
    }
}


