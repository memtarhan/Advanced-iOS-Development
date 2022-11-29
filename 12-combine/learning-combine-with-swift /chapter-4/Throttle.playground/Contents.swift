import Combine
import Foundation

let cityPublisher = ["San Jose", "San Francisco", "Menlo Park", "Palo Alto"].publisher

final class CitySubscriber: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(3))
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print("City: \(input)")
        return .none
    }

    func receive(completion: Subscribers.Completion<Never>) {
        print("Subscription: \(completion)")
    }

    typealias Input = String
    typealias Failure = Never
}

let citySubscription = CitySubscriber()
cityPublisher.subscribe(citySubscription)
