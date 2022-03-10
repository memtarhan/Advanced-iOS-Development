//
//  KeyframeAnimationsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class KeyframeAnimationsViewController: UIViewController {

    // MARK: Storyboard outlets
    @IBOutlet weak var animationTarget: UIButton!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: UI Setup
        animationTarget.round(cornerRadius: animationTarget.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire keyframe animation
    }

    // MARK: Keyframe animation
    
}
