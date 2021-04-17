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

        fetch(withId: 1) { music in
            print("Fetched music: \(music.name!)")
            music.description = "Completely NEW"
            music.dict = ["dict": 10]

            // self.update(music)

            if let musicData = try? JSONEncoder().encode(music) {
                if let anotherMusic = try? JSONDecoder().decode(Music.self, from: musicData) {
                    print("Updated music with dict: \(anotherMusic.dict)")
                }
            }
        }

//        fetch { musics in
//            print("Fetched musics: \(musics)")
//        }
    }

    private func fetch(_ completionHandler: @escaping ([Music]) -> Void) {
        let urlString = "\(baseURL)/music"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                if let musics = try? JSONDecoder().decode([Music].self, from: data) {
                    completionHandler(musics)
                }
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

    private func delete(_ music: Music) {
        let urlString = "\(baseURL)/music/id/\(music.guid!)"

        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            print(String(data: data, encoding: .ascii) ?? "NO DATA")
        }

        task.resume()
    }
}

class Music: Codable {
    var guid: String?
    var url: URL?
    var name: String?
    var description: String?
    var dict: [String: Int]?

    enum CodingKeys: String, CodingKey {
        case guid = "id"
        case url = "music_url"
        case name, description, dict
    }

//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        // Could be used to format dates
//        let val = try values.decode(String.self, forKey: .guid)
//        guid = "id: \(val)"
//        name = try values.decode(String.self, forKey: .name)
//        dict = try values.decode([String: Int].self, forKey: .dict)
//        // should do it for other properties too
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        let serverGUID = guid?.replacingOccurrences(of: "id:", with: "")
//        try container.encode(serverGUID, forKey: .guid)
//        try container.encode(url, forKey: .url)
//        try container.encode(dict, forKey: .dict)
//        // Should do it for other properties too
//    }
}
