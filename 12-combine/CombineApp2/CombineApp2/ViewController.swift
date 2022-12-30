//
//  ViewController.swift
//  CombineApp2
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import Combine
import UIKit

struct User: Codable {
    let id: String

    static var unknown: User {
        return User(id: "-1")
    }
}

class ViewController: UIViewController {
    private var cancellable: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        let publisher = NotificationCenter.default.publisher(for: .networkResult)
            .map { notification in
                notification.object as! Data
            }
            .flatMap { data in
                Just(data)
                    .decode(type: User.self, decoder: JSONDecoder())
                    .catch { _ in
                        Just(User.unknown) // Just is a publisher that only emits one value and then completes
                    }
            }

        /*
         After adding the decode line, our publisher no longer has a Never type as failure, because decode can produce errors. So, the compiler is telling you that the types don't match anymore. We need to do something that catches any error produced by decode and transforms that into a Never-failing operation. Combine has another useful operator that can help us in this scenario: catch
         */

        cancellable = publisher.sink { item in
            print(item)
        }

        postNotification()
        postNotificationThatFails()
        postNotification()

        /*

         1- First, we are creating a publisher that emits any value from the Notification Center that arrives under the name networkResult. This matches the notification name we are sending in the postNotification() method.
         2- We are subscribing to the publisher created in the previous step, and we store the result in the cancellable property. We are using sink when creating the subscriber to define a completion block that will print to the console any value received.
         3- Finally, we post a notification.

         */
    }

    private func postNotification() {
        let networkResponse = try! JSONEncoder().encode(User(id: "123"))
        NotificationCenter.default.post(name: .networkResult, object: networkResponse)
    }

    private func postNotificationThatFails() {
        let networkResponse = Data(base64Encoded: "abcd")!
        NotificationCenter.default.post(name: .networkResult, object: networkResponse)
    }
}

extension Notification.Name {
    static let networkResult = Notification.Name("networkResult")
}
