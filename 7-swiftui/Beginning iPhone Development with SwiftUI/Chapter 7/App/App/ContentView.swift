//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 12/03/2022.
//

import SwiftUI

// MARK: - User Text Input

/*
 To retrieve text from the user, SwiftUI offers three types of views:

 -  Text Field

 -  Secure Field

 -  Text Editor

 A Text Field lets the user type in a single line of text such as a name or an address. Optionally, Text Fields can display placeholder text that appears in light gray and is used to explain what type of information the Text Field expects.

 A Secure Field works exactly like a Text Field except that it masks any text the user types in. That can be useful when asking the user to type in sensitive information such as credit card numbers.

 A Text Editor appears as a large box where the user can type and edit several lines of text such as multiple paragraphs.

 */
struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(spacing: 32) {
            Text("My name is \(name)")
                .font(.largeTitle)
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
