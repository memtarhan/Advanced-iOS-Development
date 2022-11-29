//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 17/03/2022.
//

import SwiftUI

// MARK: - Using Forms and Group Boxes

/*
 A SwiftUI Form works in a similar way by grouping related views together that offers options and settings that the user can select. Forms consist of an optional header, optional footer, and content inside defined by views such as Text, Slider, or Toggle views
 */
// struct ContentView: View {
//    @State var isToggleOn = false
//    @State var volume = 0.5
//
//    var body: some View {
//        VStack {
//            Form {
//                Section(header: Text("Header 1"), footer: Text("Footer 1"), content: {
//                    Text("Text inside form")
//                    Toggle(isOn: $isToggleOn) {
//                        Text("Volume On/Of")
//                    }
//                    Slider(value: $volume)
//                })
//
//                Section(header: Text("Header 2"), footer: Text("Footer 2"), content: {
//                    Text("Text inside form")
//                    Toggle(isOn: $isToggleOn) {
//                        Text("Volume On/Of")
//                    }
//                    Slider(value: $volume)
//                })
//            }
//        }
//    }
// }

// MARK: - Creating a Simple Form

struct ContentView: View {
    @State var messageOne = ""
    @State var messageTwo = ""
    
    var body: some View {
        VStack {
            Form {
                Text("This is the first Form")
                TextField("Type here", text: $messageOne)
            }
            Form {
                Text("This is the second Form")
                TextField("Type here", text: $messageTwo)
            }
            Text("Form #1 = \(messageOne)")
            Text("Form #2 = \(messageTwo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
