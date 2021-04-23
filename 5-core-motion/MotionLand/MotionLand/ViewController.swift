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
        }
    }
}
