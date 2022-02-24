//
//  PendulumViewController.swift
//  Dynamics
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class PendulumViewController: UIViewController {
    @IBOutlet var boxView: UIView!

    var animator: UIDynamicAnimator?
    var pendulum: PendulumBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        let pivot = CGPoint(x: view.center.x, y: 20)
        pendulum = PendulumBehavior(bob: boxView, pivot: pivot)

        animator?.addBehavior(pendulum!)
    }

    @IBAction func didDrag(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            pendulum?.beginDragging(at: sender.location(in: view))
        case .ended, .cancelled:
            pendulum?.endDragging(with: sender.velocity(in: view))
        default:
            pendulum?.drag(to: sender.location(in: view))
        }
    }
}
