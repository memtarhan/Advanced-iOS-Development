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

    var timer = Timer()
    var elapsedSeconds = 0.0
    let interval = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func didTapStart(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            statusLabel.text = "On"
            sender.setTitle("Stop", for: .normal)

            if CMPedometer.isStepCountingAvailable() {
                startTimer()
                pedometer.startUpdates(from: Date()) { data, error in
                    if let error = error {
                        print("Pedometer: error -> \(error.localizedDescription)")

                    } else if let data = data {
                        self.pedometerData = data
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

    func startTimer() {
        print("Started timer on: \(Date())")
        if !timer.isValid {
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { _ in
                self.displayPedometerData()
                self.elapsedSeconds += self.interval
            })
        }
    }

    private func minutesSeconds(_ seconds: Double) -> String {
        let mMinutes = Int(seconds) / 60
        let mSeconds = Int(seconds) % 60
        return String(format: "%02i:%02i", mMinutes, mSeconds)
    }

    private func calculatePace() -> Double {
        if pedometerData.distance as! Int > 0 {
            return elapsedSeconds / (pedometerData.distance as! Double)
        }
        return 0
    }

    private func displayPedometerData() {
        if let distance = pedometerData.distance {
            DispatchQueue.main.async {
                self.distanceLabel.text = String(format: "%6.2f", distance)
            }
        }

        if CMPedometer.isPaceAvailable() {
            DispatchQueue.main.async {
                self.paceLabel.text = String(format: "%6.2f", self.calculatePace())
            }

        } else {
            paceLabel.text = "Pace is not supported"
        }

        DispatchQueue.main.async {
            self.stepsLabel.text = "\(self.pedometerData.numberOfSteps)"
            self.statusLabel.text = "On: \(self.minutesSeconds(self.elapsedSeconds))"
        }
    }
}
