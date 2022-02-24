//
//  GravityViewController.swift
//  Dynamics
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    @IBOutlet var boxView: UIView!

    // - Dynamic animator
    var animator: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        let gravity = UIGravityBehavior(items: [boxView])
        animator?.addBehavior(gravity)

        let collision = UICollisionBehavior(items: [boxView])
        let boundary = UIBezierPath(rect: view.bounds)
        collision.addBoundary(withIdentifier: "walls" as NSCopying, for: boundary)
        animator?.addBehavior(collision)
    }
}
