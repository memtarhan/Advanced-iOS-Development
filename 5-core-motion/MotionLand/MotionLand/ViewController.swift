//
//  ViewController.swift
//  MotionLand
//
//  Created by Mehmet Tarhan on 21.04.2021.
//

import CoreMotion
import UIKit

class ViewController: UIViewController {
    let motionManager = CMMotionManager()

    let interval = 0.5
    var timer = Timer()

    var isDevicesAvailable: Bool {
//        let gyroAvailable = motionManager.isGyroActive
//        let accelerometerAvailable = motionManager.isAccelerometerAvailable

        if !motionManager.isDeviceMotionAvailable {
            let alertController = UIAlertController(title: "Oopps", message: "Mo motion available", preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        return motionManager.isDeviceMotionAvailable
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isDevicesAvailable {
            print("CoreMotion launched")
//            pushDeviceMotion()
            pullDeviceMotion()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionManager.stopDeviceMotionUpdates()
        timer.invalidate()
    }

    func pushDeviceMotion() {
        motionManager.deviceMotionUpdateInterval = interval
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { motion, error in
            if let motion = motion,
               error == nil {
                print("Motion: \(motion.userAcceleration.x) -> \(Date())")
            }
        }
    }

    func pullDeviceMotion() {
        motionManager.deviceMotionUpdateInterval = interval
        motionManager.startDeviceMotionUpdates()

        triggerTimer()
    }

    private func triggerTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { _ in
            if let deviceMotion = self.motionManager.deviceMotion {
                print("Motion on X: \(deviceMotion.userAcceleration.x) -> \(Date())")
            }
        })
    }
}
