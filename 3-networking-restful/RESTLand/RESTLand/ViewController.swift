//
//  ViewController.swift
//  RESTLand
//
//  Created by Mehmet Tarhan on 8.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fetch()
    }

    
    private func fetch() {
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let dataString = String(data: data!, encoding: .ascii)
                print("Fetched: \(String(describing: dataString))")
            }
            
            task.resume()
        }
    }

}

