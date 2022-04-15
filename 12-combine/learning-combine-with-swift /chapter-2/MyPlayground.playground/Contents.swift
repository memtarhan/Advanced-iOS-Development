import Combine
import UIKit
import SwiftUI

// let just = Just("Hello World!")
//    .sink { value in
//        print("Value is \(value)")
//    }
//
// let notification = Notification(name: .NSSystemClockDidChange, object: nil, userInfo: nil)
// let notificationClockPublisher = NotificationCenter.default.publisher(for: .NSSystemClockDidChange)
//    .sink { value in
//        print("Clock: \(value)")
//    }
// NotificationCenter.default.post(notification)

// MARK: - Operators

/*
 Combine's business logic

 * Filter and manipulate values from an upstream publisher
 * Each operator returns a new publisher

 */

/// .map
// [1, 5, 9]
//    .publisher
//    .map { $0 * $0 }
//    .sink { print($0) }
//
// let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
// struct Task: Decodable {
//    let id: Int
//    let title: String
//    let userId: Int
//    let body: String
// }
//
// let dataPublisher = URLSession.shared.dataTaskPublisher(for: url)
//    .map { $0.data }
//    .decode(type: [Task].self, decoder: JSONDecoder())
// let cancellableSink = dataPublisher
//    .sink(receiveCompletion: { completion in
//        print(completion)
//    }) { tasks in
//        print("Result \(String(describing: tasks.first?.title))")
//    }

// MARK: - Subscribers

/*
 * Contract to receive sequence of values
 * Has two possible outcomes, input and failure
 * Continues to receive as publisher transmits (demands)
 * sink and .assing for receiving values
 * Conform to AnyCancellable to cancel
 */

[1, 5, 9]
    .publisher
    .sink { print($0) }

let label = UILabel()
Just("John")
    .map { "My name is \($0)" }
    .assign(to: \.text, on: label)
