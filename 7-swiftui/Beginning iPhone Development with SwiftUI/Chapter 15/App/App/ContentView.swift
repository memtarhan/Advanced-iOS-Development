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
// struct ContentView: View {
//    @State var sliderValue = 0.0
//    @State var message = ""
//    @State var flag = true
//
//    var body: some View {
//        DisclosureGroup("Expand Me") {
//            Text("You typed = \(message)")
//            TextField("Type here", text: $message)
//                .padding()
//            Text(flag ? "Toggle = true" : "Toggle = false")
//            Toggle(isOn: $flag) {
//                Text("Toggle")
//            }.padding()
//            Text("The slider value = \(sliderValue)")
//            Slider(value: $sliderValue, in: 0 ... 15)
//                .padding()
//        }
//        .padding()
//    }
// }

// MARK: - Using a Scroll View

// struct ContentView: View {
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false, content: {
//            ForEach(0 ..< 50) {
//                Text("Item #\($0)")
//            }
//        })
//            .padding()
//    }
// }

// MARK: - Using an Outline Group

/*
 Outline Groups display arrays of objects that define relationships. To use an Outline Group, you need to do the following:

 - Create a class that holds the data you want to display.
 - Create an array that holds multiple objects defined by the class.
 - Create an Outline Group that displays the data stored in the objects.
 */

class Species: Identifiable {
    let id = UUID()
    var name: String
    var classification: [Species]?

    init(name: String, classification: [Species]? = nil) {
        self.name = name
        self.classification = classification
    }
}

var animals: [Species] = [
    Species(name: "Mammal", classification: [
        Species(name: "Dog", classification: [
            Species(name: "Poodle"),
            Species(name: "Collie"),
            Species(name: "St. Bernard"),
        ]),
        Species(name: "Cat"),
        Species(name: "Elephant"),
        Species(name: "Whale"),
    ]),
    Species(name: "Bird", classification: [
        Species(name: "Canary"),
        Species(name: "Parakeet"),
        Species(name: "Eagle"),
    ]),
]

struct ContentView: View {
    var body: some View {
        VStack {
            OutlineGroup(animals, id: \.id, children: \.classification) { creature in
                Text(creature.name)
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
