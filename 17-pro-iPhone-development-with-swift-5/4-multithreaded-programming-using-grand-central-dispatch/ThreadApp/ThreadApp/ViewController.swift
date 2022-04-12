//
//  ViewController.swift
//  ThreadApp
//
//  Created by Mehmet Tarhan on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var spinnerView: UIActivityIndicatorView!

    let group = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView.hidesWhenStopped = true
    }

    @IBAction func doButton(_ sender: UIButton) {
        let startTime = Date()
        resultsTextView.text = ""
        spinnerView.startAnimating()
        let queue = DispatchQueue.global(qos: .default)
        queue.async {
            let fetchedData = self.fetchSomethingFromServer()
            let processedData = self.processData(fetchedData)
            var firstResult: String!
            var secondResult: String!
            let group = DispatchGroup()
            queue.async(group: group) {
                firstResult = self.calculateFirstResult(processedData)
            }
            queue.async(group: group) {
                secondResult = self.calculateSecondResult(processedData)
            }
            group.notify(queue: queue) {
                let resultsSummary = "First: [\(firstResult!)]\nSecond: [\(secondResult!)]"
                DispatchQueue.main.async {
                    self.resultsTextView.text = resultsSummary
                    self.spinnerView.stopAnimating()
                }
                let endTime = Date()
                print("Completed in \(endTime.timeIntervalSince(startTime)) seconds")
            }
        }
    }

    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }

    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 1)
        return data.uppercased()
    }

    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 1)
        let message = "Number of chars: \(String(data).count)"
        return message
    }

    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 1)
        return data.replacingOccurrences(of: "E", with: "e")
    }
}
