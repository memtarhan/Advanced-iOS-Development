//
//  SpringsAndTransitionsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class SpringsAndTransitionsViewController: UIViewController {

    // MARK: Storyboard outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textfieldContainer: UIView!
    @IBOutlet weak var continueButton: CustomButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var footerLabel: UILabel!
    
    // MARK: Additional variables
    let phoneTextfield = UITextField()
    let swappedFooterLabel = UILabel()
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Programmatic views for transitions
        phoneTextfield.frame = CGRect(x: 0, y: (passwordTextfield.frame.origin.y + passwordTextfield.frame.size.height + 18), width: 225, height: 35)
        phoneTextfield.placeholder = "Phone Number"
        phoneTextfield.backgroundColor = .white
        phoneTextfield.layer.cornerRadius = 5.0
        phoneTextfield.font = UIFont.systemFont(ofSize: 14)
        phoneTextfield.borderStyle = .roundedRect
        phoneTextfield.contentVerticalAlignment = .center
        
        swappedFooterLabel.frame = footerLabel.bounds
        swappedFooterLabel.backgroundColor = .white
        swappedFooterLabel.text = "Maybe next time!"
        swappedFooterLabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
        swappedFooterLabel.textColor = .black
        swappedFooterLabel.textAlignment = .center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Animation setup
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
    }

    // MARK: Action buttons
    @IBAction func segmentControlOnSelected(_ sender: UISegmentedControl) {
        // TODO: Toggle UI layout
    }
    
    @IBAction func continueOnButtonPressed(_ sender: UIButton) {
        // TODO: Swap footer label
    }
    
    // MARK: Animations & Transitions
    
}
