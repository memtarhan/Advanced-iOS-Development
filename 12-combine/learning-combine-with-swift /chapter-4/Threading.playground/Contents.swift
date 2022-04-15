import Combine
import Foundation

public struct Post: Codable {
    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String
}

print("Publisher: On main thread?: \(Thread.current.isMainThread)")
print("Publisher: thread info: \(Thread.current)")

let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
let queue = DispatchQueue(label: "a queue")
let publisher = URLSession.shared.dataTaskPublisher(for: url!)
    .map { $0.data }
    .decode(type: [Post].self, decoder: JSONDecoder())

let cancellableSink = publisher
    .subscribe(on: DispatchQueue(label: "a queue"))
//    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: { completion in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    }) { posts in
        print("Subscriber: On main thread?: \(Thread.current.isMainThread)")
        print("Subscriber: thread info: \(Thread.current)")
    }
