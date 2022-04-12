//
//  ViewController.swift
//  ThreadApp
//
//  Created by Mehmet Tarhan on 12/04/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doButton(_ sender: UIButton) {
        let startTime = NSDate()
        resultsTextView.text = ""
        let fetchedData = fetchSomethingFromServer()
        let processedData = processData(fetchedData)
        let firstResult = calculateFirstResult(processedData)
        let secondResult = calculateSecondResult(processedData)
        let resultsSummary =
            "First: [\(firstResult)]\nSecond: [\(secondResult)]"
        resultsTextView.text = resultsSummary
        let endTime = NSDate()
        print("Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds")
    }

    func fetchSomethingFromServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }

    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }

    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        let message = "Number of chars: \(String(data).count)"
        return message
    }

    func calculateSecondResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }
}
