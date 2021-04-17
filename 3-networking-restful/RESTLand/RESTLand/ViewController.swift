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
        fetch(withId: 1) { music in
            print("Fetched music: \(music.name!)")
            music.description = "Completely NEW"
            self.update(music)
        }
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

    private func fetch(withId id: Int, completionHandler: @escaping (Music) -> Void) {
        let urlString = "\(baseURL)/music/id/\(id)"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                if let music = try? JSONDecoder().decode(Music.self, from: data) {
                    completionHandler(music)
                }
            }

            task.resume()
        }
    }

    private func save(_ music: Music) {
        let urlString = "\(baseURL)/music/"

        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(music.self)

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            print(String(data: data, encoding: .ascii) ?? "NO DATA")
        }

        task.resume()
    }
    
    private func update(_ music: Music) {
        let urlString = "\(baseURL)/music/id/\(music.guid!)"

        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(music.self)

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            print(String(data: data, encoding: .ascii) ?? "NO DATA")
        }

        task.resume()
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
