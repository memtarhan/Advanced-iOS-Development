import UIKit

class BankAccount {
    
    var balance: Double
    let lock = NSLock()
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func withdraw(_ amount: Double) {
        
        lock.lock()
        if balance >= amount {
            
            let processingTime = UInt32.random(in: 0...3)
            print("[Withdraw] Processing for \(amount) \(processingTime) seconds")
            sleep(processingTime)
            print("Withdrawing \(amount) from account")
            balance -= amount
            print("Balance is \(balance)")
        }
        lock.unlock()
        
    }
    
}

let bankAccount = BankAccount(balance: 500)

let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)

queue.async {
    bankAccount.withdraw(300)
}

queue.async {
    bankAccount.withdraw(500)
}


