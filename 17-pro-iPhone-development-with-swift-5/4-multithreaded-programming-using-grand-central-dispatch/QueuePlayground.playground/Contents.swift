import UIKit

let queue1 = DispatchQueue(label: "queue1")
let queue2 = DispatchQueue(label: "queue2")
let queue3 = DispatchQueue(label: "queue3")

var value = 1

queue1.async {
    value = 2
    print("queue1: \(value)")
    print(queue1.label)
}

queue2.async {
    value = 3
    print("queue2: \(value)")
    print(queue2.label)
}

queue3.async {
    value = 4
    print("queue3: \(value)")
    print(queue3.label)
}

print("Program stopped")
