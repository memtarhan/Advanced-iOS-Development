//
//  SpringViewController.swift
//  Dynamics
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class SpringViewController: UIViewController {
    
    @IBOutlet weak var boxView: UIView!
    
    var animator: UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let gravity = UIGravityBehavior(items: [boxView])
        animator?.addBehavior(gravity)

        let attachmentPoint = CGPoint(x: 100, y: 100)
        let attachment = UIAttachmentBehavior(item: boxView, attachedToAnchor: attachmentPoint)
        attachment.damping = 0.1
        animator?.addBehavior(attachment)
    }
}
