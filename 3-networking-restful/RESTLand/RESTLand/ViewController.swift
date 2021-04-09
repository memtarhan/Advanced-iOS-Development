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
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                let dataString = String(data: data!, encoding: .ascii)
                print("Fetched: \(String(describing: dataString))")
            }

            task.resume()
        }
    }

    private func fetch(withId id: Int) {
        let urlString = "\(baseURL)/music/\(id)"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                if let objectData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    if let arrayData = objectData as? [Any],
                       let value = arrayData.first as? [String: Any] {
                        let music = Music()
                        music.id = value["id"] as? String
                        music.music_url = value["music_url"] as? String
                        music.name = value["name"] as? String
                        music.description = value["description"] as? String
                        print("Fetched music w/ id: \(music)")
                    }
                }
            }

            task.resume()
        }
    }
}

class Music {
    var id: String?
    var music_url: String?
    var name: String?
    var description: String?
}
