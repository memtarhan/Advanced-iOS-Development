import UIKit

let baseURL = "https://jsonplaceholder.typicode.com/todos"

struct ToDo: Decodable, CustomStringConvertible {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool

    var description: String { "ToDo: \(title) by \(userId)" }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

func getToDos(id1: Int, id2: Int) async throws -> [ToDo] {
    guard let url1 = URL(string: "\(baseURL)/\(id1)"),
          let url2 = URL(string: "\(baseURL)/\(id2)") else {
        throw NetworkError.invalidURL
    }

    async let (data1, _) = URLSession.shared.data(from: url1)
    async let (data2, _) = URLSession.shared.data(from: url2)

    // some custom can go here
    let todo1 = try? JSONDecoder().decode(ToDo.self, from: try await data1)
    let todo2 = try? JSONDecoder().decode(ToDo.self, from: try await data2)

    guard let todo1, let todo2 else {
        throw NetworkError.decodingError
    }

    return [todo1, todo2]
}

Task {
    if let todos = try? await getToDos(id1: 1, id2: 2) {
        print("fetched ToDos \(todos)")
    }
}
