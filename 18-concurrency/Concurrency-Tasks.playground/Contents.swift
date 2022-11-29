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

// Task {
//    if let todos = try? await getToDos(id1: 1, id2: 2) {
//        print("fetched ToDos \(todos)")
//    }
// }

func getToDo(id: Int) async throws -> ToDo {
    if id == 0 {
        throw NetworkError.noData
    }

    guard let url = URL(string: "\(baseURL)/\(id)") else {
        throw NetworkError.invalidURL
    }

    async let (data, _) = URLSession.shared.data(from: url)

    let todo = try? JSONDecoder().decode(ToDo.self, from: try await data)

    guard let todo else {
        throw NetworkError.decodingError
    }

    return todo
}

let ids = [0, 1, 2, 3, 4, 5]

Task {
    for id in ids {
        print("will fetch \(id) at \(Date())")
        do {
            try Task.checkCancellation()
            let todo = try await getToDo(id: id)
            print("will fetch \(todo.id) at \(Date())")
       
        } catch {
            print("did fail to fetch \(id) error: \(error)")
        }
    }
}
