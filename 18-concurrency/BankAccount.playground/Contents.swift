import UIKit

class BankAccount {
    var balance: Double

    init(balance: Double) {
        self.balance = balance
    }

    func withdraw(_ amount: Double) {
        if balance >= amount {
            let processingTime = UInt32.random(in: 0 ... 3)
            print("(Withdraw) processing for \(amount) \(processingTime) seconds")
            sleep(processingTime)
            print("(Withdraw) withdrawing \(amount) ... at: \(Date().debugDescription)")
            balance -= amount
            print("(Withdraw) withdrew \(amount) at: \(Date().debugDescription)")
            print("(Balance) after is \(balance)")
        }
    }
}

//let account = BankAccount(balance: 100)
//
//let concurrentQueue = DispatchQueue(label: "Concurrent", attributes: .concurrent)
//
//concurrentQueue.async {
//    account.withdraw(20)
//}
//
//concurrentQueue.async {
//    account.withdraw(50)
//}
//
//print("(Balance) current is \(account.balance)")

let serialQueue = DispatchQueue(label: "Serial")

let accoun2 = BankAccount(balance: 1000)

serialQueue.async {
    accoun2.withdraw(200)
}

serialQueue.async {
    accoun2.withdraw(500)
}

print("(Balance) current is \(accoun2.balance)")
