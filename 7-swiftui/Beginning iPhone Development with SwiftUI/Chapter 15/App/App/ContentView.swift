//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 29/03/2022.
//

import SwiftUI

// MARK: - Using a Disclosure Group

/*
 Like a stack, a Disclosure Group can hold a maximum of ten views. However, one or more of those views can be stacks that can hold multiple views. In addition, you can nest Disclosure Groups inside of other Disclosure Groups.
 */
struct ContentView: View {
    @State var sliderValue = 0.0
    @State var message = ""
    @State var flag = true

    var body: some View {
        DisclosureGroup("Expand Me") {
            Text("You typed = \(message)")
            TextField("Type here", text: $message)
                .padding()
            Text(flag ? "Toggle = true" : "Toggle = false")
            Toggle(isOn: $flag) {
                Text("Toggle")
            }.padding()
            Text("The slider value = \(sliderValue)")
            Slider(value: $sliderValue, in: 0 ... 15)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
