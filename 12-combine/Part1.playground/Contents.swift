import Combine
import UIKit

// MARK: - Combine workflow

/*

 1 - The Subscriber tells the Publisher that it wants to subscribe. The Publisher sends back a subscription. The Subscriber uses that subscription to start requesting elements. The subscriber can request from N to unlimited values.
 2 - Now the Publisher is free to send those values over time. The Subscriber will receive those inputs.
 3 - In subscriptions that are not expecting unlimited values, a completion event is sent to the Subscriber, so it is aware that the subscription is over.

 */

let publisher = [1, 2, 3, 4].publisher
/// We use the method sink to attach a subscriber to the publisher, defining inside its completion block an action to perform over each value received over time.
let subscriber = publisher.sink { element in
    print(element)
}

print("*******************")

// Using filter
/// The filter operator is used to just remove values matching some condition out of the stream.

let evenNumbersSubscriber = publisher
    .filter { $0 % 2 == 0 }
    .sink { print($0) }

print("*******************")

// Using map
/// The map operator helps us to apply a certain operation to every value of the stream, transforming it into a different type.

struct User: CustomStringConvertible {
    var id: Int

    var description: String { "User with id: \(id)" }
}

let mappedSubscriber = publisher
    .map { User(id: $0) }
    .sink { print($0.description) }

print("*******************")

// Using reduce
/// The reduce operator returns the result of combining all the values of the stream using a given operation to apply.

let reduceExample = [1, 2, 3, 4].publisher
    .reduce(1, { $0 * $1 })
    .sink(receiveValue: { print("\($0)", terminator: " ") })

print("*******************")

// Using scan
/// An operator very much related to reduce is scan. The scan operator does exactly the same as reduce but it emits the result at each step

let scanExample = [1, 2, 3, 4].publisher
    .scan(1, { $0 * $1 })
    .sink(receiveValue: { print("\($0)", terminator: " ") })

print("*******************")

// Using combineLatest
/// It is a publisher that combines the latest values from two other publishers. Both publishers must have the same failure type. The downstream subscriber will receive a tuple of the most recent elements from the upstream publishers when any of them emit a new value.

let chars = PassthroughSubject<String, Never>()
let numbers = PassthroughSubject<Int, Never>()
let cancellableCombineLatest = chars.combineLatest(numbers)
    .sink { print("Combine Latest Result: \($0).") }

print("*******************")

// Using merge
/// With merge, we will aggregate multiple input publishers into a single stream, and the output will be just the latest value from any of them

let oddNumbers = PassthroughSubject<Int, Never>()
let evenNumbers = PassthroughSubject<Int, Never>()
let cancellable2 = oddNumbers.merge(with: evenNumbers)
    .sink { print("Result: \($0).") }
oddNumbers.send(1)
evenNumbers.send(2)
oddNumbers.send(3)

print("*******************")

// Using zip
/// zip is a publisher that emits a pair of elements when both input publishers have emitted a new value
let cancellableZip = chars.zip(numbers)
    .sink { print("Zip Result: \($0).") }

chars.send("a")
numbers.send(1)
chars.send("b")
chars.send("c")
numbers.send(2)
numbers.send(3)
/*
 Notice how zip doesn't send a new pair of values downstream until both of the publishers have emitted a new value. And when that happens, it will send a tuple with the oldest non-emitted values of both of them. CombineLatest will use the most recent and will emit a tuple every time one of the publishers emits a single new value (it will not wait to have both publishers emitting!). That is the main difference.
 */
