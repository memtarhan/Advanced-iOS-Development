import Combine
import UIKit

// MARK: - Understanding Subject

/*
 As per the Apple documentation:

 "A subject is a publisher that exposes a method for outside callers to publish elements."

 The definition is pretty straightforward. Subjects are like publishers, but they have a method, send(_:), which you can use to inject new elements into their stream. A single Subject allows multiple subscribers to be connected at the same time.

 There are two types of built-in subjects: CurrentValueSubject and PassthroughSubject. Let's see the differences between them.

 */

// Working with CurrentValueSubject
/*
 This is a subject that holds an initial value. It broadcasts the current value every time it changes.

 When a subscriber connects to a CurrentValueSubject, it will receive the current value, and the next ones when it changes. This means that a CurrentValueSubject has state.
 */

let currentValueSubject = CurrentValueSubject<String, Never>("first value")
let subscriberCurrent = currentValueSubject.sink { print("subscriberCurrent received: \($0)") }
currentValueSubject.send("second value")
/*
 -  When we initialize the subject, we need to pass an initial value.
 -  When the subscriber subscribes, it gets the current value that is held in the subject. Note how in the console output, the subscriber has printed first value even though we subscribed to the subject after that value was generated.
 -  Every time we call send(_:), the subscribers get the next value.
 */

// Working with PassthroughSubject
/*
 The main difference between PassthroughSubject and CurrentValueSubject is that PassthroughSubject doesn't hold any state
 */

let passthroughSubject = PassthroughSubject<String, Never>()
passthroughSubject.send("first value")
let subscriberPassthrough = passthroughSubject.sink { print("subscriberPassthrough received: \($0)") }
passthroughSubject.send("second value")
/*
 Notice how the subscriber is created after the first value is sent. This first value is not received, because there was no subscriber connected yet. However, the second value is displayed in the output because it was sent after the subscription was established.
 */
