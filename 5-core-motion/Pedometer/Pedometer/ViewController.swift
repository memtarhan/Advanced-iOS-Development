//
//  ViewController.swift
//  Pedometer
//
//  Created by Mehmet Tarhan on 22.04.2021.
//

import CoreMotion
import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var stepsLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var paceLabel: UILabel!
    @IBOutlet var startButton: UIButton!

    // MARK: - Properties

    var pedometer = CMPedometer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func didTapStart(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            statusLabel.text = "On"
            sender.setTitle("Stop", for: .normal)

            if CMPedometer.isStepCountingAvailable() {
                pedometer.startUpdates(from: Date()) { data, error in
                    if let error = error {
                        print("Pedometer: error -> \(error.localizedDescription)")

                    } else if let data = data {
                        self.stepsLabel.text = "\(data.numberOfSteps)"
                    }
                }

            } else {
                print("No step counting")
                stepsLabel.text = "Not Available"
            }
        } else {
            pedometer.stopUpdates()
            statusLabel.text = "Off"
            sender.setTitle("Start", for: .normal)
        }
    }
}
