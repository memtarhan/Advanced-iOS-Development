//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 11/03/2022.
//

import SwiftUI

// struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("This is a non-limited Text, \n it has no line limit. \n It can do whatever it wants! \n Ha ha ha")
//                .padding()
//                .background(Color.yellow)
//
//            Text("This is only \n 2 line Text")
//                .font(.footnote)
//                .fontWeight(.semibold)
//                .foregroundColor(Color.red)
//                .multilineTextAlignment(.center)
//                .lineLimit(2)
//                .padding()
//                .background(Color.yellow)
//                .truncationMode(.tail)
//        }
//    }
// }

// MARK: - Using the Label View

// - Similar to the Text view is the Label view. While the Text view just displays a single string of text, the Label view can display both a string and an image side by side

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Label("House", systemImage: "house.fill")
//            Label("Custom image", image: "custom")
//
//            // More customizable Label
//            Label {
//                Text("More customized")
//                    .font(.title)
//            } icon: {
//                Image(systemName: "pencil")
//                    .font(.title)
//                    .opacity(0.25)
//            }
//
//            // Icon only
//            Label("Icon only", systemImage: "hare.fill")
//                .labelStyle(.iconOnly)
//        }
//    }
//}

// MARK: - Adding a Border Around a Text or Label View
// - To highlight both a Text and a Label view, you can add a border around them
struct ContentView: View {
    var body: some View {
        VStack {
            Text("A border around a Text view")
                .border(Color.red, width: 3)
            Label("A border around a Label view", systemImage: "folder.fill")
                .padding()
                .border(Color.green, width: 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
