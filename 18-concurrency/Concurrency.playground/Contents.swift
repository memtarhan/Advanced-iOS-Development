import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct Post: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

func getPosts(_ completion: @escaping (Result<[Post], NetworkError>) -> Void) {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        completion(.failure(.invalidURL))
        return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else {
            completion(.failure(.noData))
            return
        }

        guard let posts = try? JSONDecoder().decode([Post].self, from: data) else {
            completion(.failure(.decodingError))
            return
        }

        completion(.success(posts))

    }.resume()
}

getPosts { result in
    switch result {
    case let .success(posts):
        print("fetched posts: \(posts.count)")
    case let .failure(error):
        print("failed fetching posts: \(error)")
    }
}

func getPosts() async throws -> [Post] {
    try await withCheckedThrowingContinuation { coninuation in
        getPosts { result in
            switch result {
            case let .success(posts):
                print("fetched posts: \(posts.count)")
                coninuation.resume(returning: posts)
            case let .failure(error):
                print("failed fetching posts: \(error)")
                coninuation.resume(throwing: error)
            }
        }
    }
}

Task {
    if let posts = try? await getPosts() {
        print("finally: \(posts.count)")
    }
}
