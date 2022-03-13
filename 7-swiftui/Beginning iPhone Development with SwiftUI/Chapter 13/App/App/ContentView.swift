//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 13/03/2022.
//

import SwiftUI

// MARK: - Using List

// struct ContentView: View {
//    var body: some View {
//        List {
//            ForEach(1 ... 25, id: \.self) { index in
//                Cell(title: "Animal #\(index)")
//            }
//        }
//    }
// }
//
// struct Cell: View {
//    @State var title = ""
//    var body: some View {
//        Text(title)
//            .foregroundColor(Color.purple)
//    }
// }

// MARK: - Displaying Array Data in a List

struct ContentView: View {
    var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]

    var body: some View {
        List {
            ForEach(0 ... myArray.count - 1, id: \.self) { index in
                Text(myArray[index])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
