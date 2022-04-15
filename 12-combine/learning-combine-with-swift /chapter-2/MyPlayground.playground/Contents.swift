import Combine
import PlaygroundSupport
import SwiftUI
import UIKit

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

// [1, 5, 9]
//    .publisher
//    .sink { print($0) }
//
// let label = UILabel()
// Just("John")
//    .map { "My name is \($0)" }
//    .assign(to: \.text, on: label)
//
// PlaygroundPage.current.liveView = label

// MARK: - Subjects

/*
 * A publisher that exposes a method for outside callers to publish elements
 * Commong for briding code from the old imperative world into modern, new Combine world
 * .send() method used to emit select values to one or more subscribers
 * As an aggregator for multiple subscribers, via subscriber demands signaling unlimited demand from connected publishers

 * currentValueSibject persist initial state values for subscribers, unlike passthroughSubject
 * Create publishers from objects which conform to ObservableObject

 */

// (1) Declare an Int PassthroughSubject
let subject = PassthroughSubject<Int, Never>()

// (2) Attach a subscriber to the subject
let subscription = subject
    .sink { print($0) }

// (3) Publish the value '94', via the subject, directly
subject.send(94)

// (4) Connect subject to a publisher, and publish the value '29'
Just(29)
    .subscribe(subject)

// (5) Declare another subject, a CurrentValueSubject, with an initial 'I am a ...' value cached
let anotherSubject = CurrentValueSubject<String, Never>("I am a ...")

// (6) Attach a subscriber to the subject
let anotherSubscription = anotherSubject
    .sink { print($0) }

// (7) Publish the value 'Subject', via the subject, directly
anotherSubject.send("Subject")
