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
                        if let json = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                            if let music = try? JSONDecoder().decode(Music.self, from: json) {
                                print(music.url ?? "No id available")
                                // Applied this function because of a problem in API
                                // Temporary solution
                            }
                        }
                    }
                }
            }

            task.resume()
        }
    }
}

class Music: Codable {
    var guid: String?
    var url: String?
    var name: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case guid = "id"
        case url = "music_url"
        case name, description
    }
}
