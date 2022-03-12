//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 12/03/2022.
//

import SwiftUI

// MARK: - Using a Picker

struct ContentView: View {
    @State var stringChoice = ""
    @State var integerChoice = 0

    var body: some View {
        VStack(spacing: 64) {
            Picker(selection: $stringChoice, label: Text("Picker")) {
                Text("1").tag("one")
                Text("2").tag("two")
                Text("3").tag("three")
                Text("4").tag("four")
                Text("5").tag("five")
            }
            .pickerStyle(WheelPickerStyle())
            
            Text("You chose \(stringChoice)")

            Picker(selection: $integerChoice, label: Text("Picker")) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }
            .pickerStyle(InlinePickerStyle())
            
            Text("You chose \(integerChoice)")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
