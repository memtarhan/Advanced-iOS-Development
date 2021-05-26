//
//  ContentView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var red = 0.0
    @State var green = 0.0
    @State var blue = 0.0

    var body: some View {
        VStack {
            Text("Color Picker")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: "scribble.variable")
                .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1.0))
                .font(.largeTitle)
                .padding()

            VStack {
                Slider(value: $red, in: 0 ... 1, step: 0.01)
                    .accentColor(/*@START_MENU_TOKEN@*/ .red/*@END_MENU_TOKEN@*/)
                Slider(value: $green, in: 0 ... 1, step: 0.01)
                    .accentColor(.green)
                Slider(value: $blue, in: 0 ... 1, step: 0.01)
                    .accentColor(.blue)
            }
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
