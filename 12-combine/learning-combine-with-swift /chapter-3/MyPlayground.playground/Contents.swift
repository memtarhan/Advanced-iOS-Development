import Combine
import Foundation

struct Post: Codable, CustomStringConvertible {
    let userId: Int
    let id: Int
    let title: String
    let body: String

    var description: String {
        "\(id) by \(userId)"
    }
}

let samplePost = Post(userId: 1,
                      id: 1,
                      title: "This is just a sample post.",
                      body: "This is supposed to body of the post.")

// (1) Create a 'dataTaskPublisher'
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let publisher = URLSession.shared.dataTaskPublisher(for: url)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())

// (2) Subscribe to the publisher
let cancellableSink = publisher.sink(receiveCompletion: { completion in
    print(String(describing: completion))
}) { posts in
    print("Posts: \(posts)")
}
