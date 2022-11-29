import Combine
import Foundation

public struct Post: Codable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
}

let emptyPost = Post(userId: 0, id: 0, title: "Empty", body: "Empty")

// (1) Create a 'dataTaskPublisher'
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())
    .map { $0.first }
    .replaceNil(with: emptyPost)
    .compactMap { $0.title }

// (2) Subscribe to the publisher
let cancellableSink = publisher
    .sink(receiveCompletion: { completion in
        print(String(describing: completion))
    }) { value in
        print("returned value: \(value)")
    }
