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
    var pedometerData = CMPedometerData()

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
                        self.pedometerData = data
                        self.update()
                        print("Pedometer: data -> on \(Date()) - \(data.numberOfSteps)")
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

    private func update() {
        if let distance = pedometerData.distance {
            DispatchQueue.main.async {
                self.distanceLabel.text = String(format: "%6.2f", distance)
            }
        }

        if CMPedometer.isPaceAvailable() {
            DispatchQueue.main.async {
                self.paceLabel.text = String(format: "%6.2f", self.pedometerData.averageActivePace!)
            }

        } else {
            paceLabel.text = "Pace is not supported"
        }

        DispatchQueue.main.async {
            self.stepsLabel.text = "\(self.pedometerData.numberOfSteps)"
        }
    }
}
