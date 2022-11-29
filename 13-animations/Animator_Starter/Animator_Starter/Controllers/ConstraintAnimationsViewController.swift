//
//  ConstraintAnimationsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class ConstraintAnimationsViewController: UIViewController {
    
    // MARK: Storyboard outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var newsletterView: UIView!
    @IBOutlet weak var welcomeCenterX: NSLayoutConstraint!
    @IBOutlet weak var newsletterCenterX: NSLayoutConstraint!
    
    // MARK: Additional variables
    var newsletterInfoLabel = UILabel()
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Programmatic views
        newsletterInfoLabel.backgroundColor = .clear
        newsletterInfoLabel.text = "Help us make your animation code that much better by subscribing to our weekly newsletter! \n\n It's free and you can unsubscribe any time without hurting our feelings...much."
        newsletterInfoLabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
        newsletterInfoLabel.textColor = .darkGray
        newsletterInfoLabel.textAlignment = .left
        newsletterInfoLabel.alpha = 1
        newsletterInfoLabel.backgroundColor = .black
        newsletterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        newsletterInfoLabel.numberOfLines = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Offscreen positioning
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
    }
    
    // MARK: Actions
    
    // MARK: Animations

}
