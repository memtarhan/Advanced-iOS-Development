import UIKit

let baseURL = "https://jsonplaceholder.typicode.com/todos"

struct ToDo: Decodable, CustomStringConvertible {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool

    var description: String { "ToDo: \(title) by \(userId)" }
}

// Decodable -> Receiving data from API
// Encodable -> Sending data to API
// Codable -> Decodable & Encodable

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

//
// func getToDo(withId id: Int, _ completion: @escaping (Result<ToDo, NetworkError>) -> Void) {
//    guard let url = URL(string: "\(baseURL)/\(id)") else {
//        completion(.failure(.invalidURL))
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        if error != nil {
//            completion(.failure(.noData))
//
//        } else if let data {
//            do {
//                let todo = try JSONDecoder().decode(ToDo.self, from: data)
//                completion(.success(todo))
//            } catch {
//                completion(.failure(.decodingError))
//            }
//
//        } else {
//            completion(.failure(.noData))
//        }
//
//    }.resume()
// }
//
// getToDo(withId: 1) { result in
//    switch result {
//    case let .success(todo):
//        print(todo)
//    case let .failure(error):
//        print(error)
//    }
// }
//
// class Interactor {
//    func getToDo(withId id: Int) async throws -> ToDo {
//        guard let url = URL(string: "\(baseURL)/\(id)") else {
//            throw NetworkError.invalidURL
//        }
//
//        let (data, response) = try await URLSession.shared.data(from: url)
//        if let httpURLResponse = response as? HTTPURLResponse {
//            print("statusCode: \(httpURLResponse.statusCode)")
//        }
//
//        return try JSONDecoder().decode(ToDo.self, from: data)
//    }
// }
//
// class ViewController: UIViewController {
//    func updateToDo(_ todo: ToDo) {
//    }
// }
//
// class Presenter {
//    var view = ViewController()
//
//    var interactor = Interactor()
//
//    func loadData() {
//        Task {
//            do {
//                let todo = try await interactor.getToDo(withId: 1)
////                view.updateToDo(todo)
//            } catch {
//                print(error)
//            }
//        }
//    }
// }
//
//
//
// struct Post: Decodable {
//    let id: Int
//    let userId: Int
//    let title: String
//    let body: String
// }
//
// func getPosts(_ completion: @escaping (Result<[Post], NetworkError>) -> Void) {
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//        completion(.failure(.invalidURL))
//        return
//    }
//
//    URLSession.shared.dataTask(with: url) { data, _, error in
//        guard let data = data, error == nil else {
//            completion(.failure(.noData))
//            return
//        }
//
//        guard let posts = try? JSONDecoder().decode([Post].self, from: data) else {
//            completion(.failure(.decodingError))
//            return
//        }
//
//        completion(.success(posts))
//
//    }.resume()
// }
//
// getPosts { result in
//    switch result {
//    case let .success(posts):
//        print("fetched posts: \(posts.count)")
//    case let .failure(error):
//        print("failed fetching posts: \(error)")
//    }
// }
//
// func getPosts() async throws -> [Post] {
//    try await withCheckedThrowingContinuation { coninuation in
//        getPosts { result in
//            switch result {
//            case let .success(posts):
//                print("fetched posts: \(posts.count)")
//                coninuation.resume(returning: posts)
//            case let .failure(error):
//                print("failed fetching posts: \(error)")
//                coninuation.resume(throwing: error)
//            }
//        }
//    }
// }
//
// Task {
//    if let posts = try? await getPosts() {
//        print("finally: \(posts.count)")
//    }
// }

func getToDo(withId id: Int) async throws -> ToDo {
    print("willFetchToDo \(id)")
    guard let url = URL(string: "\(baseURL)/\(id)") else {
        throw NetworkError.invalidURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)

    let todo = try JSONDecoder().decode(ToDo.self, from: data)
    print("didFetchToDo \(id)")
    return todo
}

let ids = [-1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let queue = OperationQueue()

 for id in ids {
    queue.addOperation {
        Task {
            do {
                try Task.checkCancellation()
                try await getToDo(withId: id)

            } catch {
                print("didFailFetching \(id) error: \(error)")
            }
        }
    }
 }

queue.waitUntilAllOperationsAreFinished()
queue.maxConcurrentOperationCount = 2

//func getToDos(ids: [Int]) async throws -> [ToDo] {
//    var todos = [ToDo]()
//
//    try await withThrowingTaskGroup(of: ToDo.self, body: { group in
//        for id in ids {
//            group.addTask {
//                try Task.checkCancellation()
//                let todo = try await getToDo(withId: id)
//                return todo
//            }
//        }
//
//        for try await (todo) in group {
//            print("processing \(todo.id)")
//            todos.append(todo)
//        }
//    })
//
//    return todos
//}
//
//Task {
//    do {
//        try Task.checkCancellation()
//        let todo = try await getToDos(ids: ids)
//
//    } catch {
//        print("did fail to fetch error: \(error)")
//    }
//}
