import Combine
import Foundation

public struct Post: Codable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
}

let samplePost = Post(userId: 1, id: 2, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")

enum APIError: Error {
    case invalidRequest
}

public class APIService {
    public static func getPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        return URLSession.shared.dataTaskPublisher(for: url!)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw APIError.invalidRequest
                }
                return data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
