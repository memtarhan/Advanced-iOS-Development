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

enum APIError: Error {
    case networkError(error: String)
    case responseError(error: String)
    case unknownError
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
let cancellableSink = publisher
    .retry(2)
    .mapError { error -> Error in
        switch error {
        case URLError.cannotFindHost:
            return APIError.networkError(error: error.localizedDescription)
        default:
            return APIError.responseError(error: error.localizedDescription)
        }
    }
    .sink(receiveCompletion: { completion in
        print(String(describing: completion))
    }) { posts in
        print("Posts: \(posts)")
    }

// (3) A simple Publisher example with '.tryMap' and 'catch'
Just(7)
    .tryMap { _ in
        throw APIError.unknownError
    }
    .catch { _ in
        Just(2)
    }
    .sink { print($0) }
