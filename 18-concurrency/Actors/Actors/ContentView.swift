//
//  ContentView.swift
//  Actors
//
//  Created by Mehmet Tarhan on 02/12/2022.
//

import SwiftUI

@MainActor
class BankAccountViewModel: ObservableObject {
    private var bankAccount: BankAccount
    @Published var currentBalance: Double?
    @Published var transactions: [String] = []

    init(balance: Double) {
        bankAccount = BankAccount(balance: balance)
    }

    func withdraw(_ amount: Double) async {
        await bankAccount.withdraw(amount)

        currentBalance = await bankAccount.getBalance()
        transactions = await bankAccount.transactions
    }
}

actor BankAccount {
    private(set) var balance: Double
    private(set) var transactions: [String] = []

    init(balance: Double) {
        self.balance = balance
    }

    func getBalance() -> Double {
        return balance
    }

    func withdraw(_ amount: Double) {
        if balance >= amount {
            let processingTime = UInt32.random(in: 0 ... 3)
            print("[Withdraw] Processing for \(amount) \(processingTime) seconds")
            transactions.append("[Withdraw] Processing for \(amount) \(processingTime) seconds")
            sleep(processingTime)
            print("Withdrawing \(amount) from account")
            transactions.append("Withdrawing \(amount) from account")

            balance -= amount

            print("Balance is \(balance)")
            transactions.append("Balance is \(balance)")
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = BankAccountViewModel(balance: 500)
    let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)

    var body: some View {
        VStack {
            Button("Withdraw") {
                Task.detached {
                    await viewModel.withdraw(200)
                }

                Task.detached {
                    await viewModel.withdraw(200)
                }
            }

            Text("\(viewModel.currentBalance ?? 0.0)")

            List(viewModel.transactions, id: \.self) { transaction in
                Text(transaction)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
