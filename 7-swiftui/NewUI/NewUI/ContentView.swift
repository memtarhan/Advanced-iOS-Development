//
//  ContentView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//

import SwiftUI

struct ContentView: View {
//    @State var red = 0.0
//    @State var green = 0.0
//    @State var blue = 0.0

    var body: some View {
        NavigationView {
            List(DataModel.data, id: \.self) { object in
                NavigationLink(object.title, destination: DetailView(data: object))
            }
            .navigationTitle("My World")
        }

//        VStack {
//            Text("Color Picker")
//                .font(.largeTitle)
//                .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1.0))
//                .multilineTextAlignment(.center)
//                .padding()
//            Image(systemName: "scribble.variable")
//                .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1.0))
//                .font(.largeTitle)
//                .padding()
//
//            VStack {
//                ColorSliderView(color: .red, colorValue: $red)
//                ColorSliderView(color: .green, colorValue: $green)
//                ColorSliderView(color: .blue, colorValue: $blue)
//            }
//            .padding()
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
