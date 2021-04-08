//
//  ViewController.swift
//  RESTLand
//
//  Created by Mehmet Tarhan on 8.04.2021.
//

import UIKit

class ViewController: UIViewController {

    private let baseURL = "https://www.orangevalleycaa.org/api"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fetch()
        fetch(withId: 1)
    }

    
    private func fetch() {
        let urlString = "\(baseURL)/music"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let dataString = String(data: data!, encoding: .ascii)
                print("Fetched: \(String(describing: dataString))")
            }
            
            task.resume()
        }
    }
    
    private func fetch(withId id: Int) {
        let urlString = "\(baseURL)/music/\(id)"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let dataString = String(data: data!, encoding: .ascii)
                print("Fetched with Id: \(String(describing: dataString))")
            }
            
            task.resume()
        }
    }

}

