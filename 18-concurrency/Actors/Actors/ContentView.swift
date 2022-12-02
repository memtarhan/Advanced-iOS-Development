//
//  ContentView.swift
//  Actors
//
//  Created by Mehmet Tarhan on 02/12/2022.
//

import SwiftUI

actor Counter {
    var value: Int = 0

    func increment() -> Int {
        value += 1
        return value
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                let counter = Counter()

                DispatchQueue.concurrentPerform(iterations: 100) { _ in
                    Task {
                        print(await counter.increment())
                    }
                }

            } label: {
                Text("Increment")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
