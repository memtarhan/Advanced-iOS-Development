import Combine
import UIKit

let just = Just("Hello World!")
    .sink { value in
        print("Value is \(value)")
    }

let notification = Notification(name: .NSSystemClockDidChange, object: nil, userInfo: nil)
let notificationClockPublisher = NotificationCenter.default.publisher(for: .NSSystemClockDidChange)
    .sink { value in
        print("Clock: \(value)")
    }
NotificationCenter.default.post(notification)
