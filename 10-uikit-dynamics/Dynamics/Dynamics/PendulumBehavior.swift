//
//  PendulumBehavior.swift
//  Dynamics
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class PendulumBehavior: UIDynamicBehavior {
    var dragging: UIAttachmentBehavior
    var push: UIPushBehavior

    init(bob: UIDynamicItem, pivot: CGPoint) {
        let gravity = UIGravityBehavior(items: [bob])
        let attachment = UIAttachmentBehavior(item: bob, attachedToAnchor: pivot)

        dragging = UIAttachmentBehavior(item: bob, attachedToAnchor: .zero)
        push = UIPushBehavior(items: [bob], mode: .instantaneous)
        push.active = false

        super.init()
        
        addChildBehavior(gravity)
        addChildBehavior(attachment)
        addChildBehavior(push)
    }
    
    func beginDragging(at point: CGPoint) {
        dragging.anchorPoint = point
        addChildBehavior(dragging)
    }
    
    func drag(to point: CGPoint) {
        dragging.anchorPoint = point
    }
    
    func endDragging(with velocity: CGPoint) {
        let x = Float(velocity.x)
        let y = Float(velocity.y)
        
        var magnitude = CGFloat(sqrtf((powf(x, 2) + powf(y, 2))))
        magnitude = magnitude / 500
        
        let angle = CGFloat(atan2(y, x))
        
        push.angle = angle
        push.magnitude = magnitude
        push.active = true
        
        removeChildBehavior(dragging)
    }
}
