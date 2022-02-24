//
//  FlickViewController.swift
//  Dynamics
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class FlickViewController: UIViewController {
    @IBOutlet var boxView: UIView!

    var animator: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        let collision = UICollisionBehavior(items: [boxView])
        let dx = -(boxView.bounds.width / 2)
        let dy = -(boxView.bounds.height / 2)
        let outside = view.bounds.insetBy(dx: dx, dy: dy)
        let boundary = UIBezierPath(rect: outside)
        collision.addBoundary(withIdentifier: "outside-walls" as NSCopying, for: boundary)
        collision.collisionDelegate = self

        animator?.addBehavior(collision)
    }

    @IBAction func didFlick(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .ended:
            let velocity = sender.velocity(in: view)
            let push = UIPushBehavior(items: [boxView], mode: .instantaneous)
            push.pushDirection = CGVector(dx: velocity.x, dy: velocity.y)
            push.magnitude = 7
            animator?.addBehavior(push)

        default:
            break
        }
    }
}

// MARK: - UICollisionBehaviorDelegate

extension FlickViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
//        boxView.removeFromSuperview()
    }
}
