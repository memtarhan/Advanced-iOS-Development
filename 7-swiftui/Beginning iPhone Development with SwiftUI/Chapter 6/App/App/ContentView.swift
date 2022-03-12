//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 12/03/2022.
//

import SwiftUI

// MARK: - Defining a Button

// struct ContentView: View {
//    var body: some View {
//        VStack(spacing: 64) {
//            Button("Click here") {
//                // actions
//            }
//            Button {
//                // actions
//            } label: {
//                Text("Customized button")
//                    .font(.largeTitle)
//                    .foregroundColor(.green)
//                    .padding()
//                    .border(Color.red, width: 6)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//
//            Button {
//                // actions
//            } label: {
//                Label("With Label", systemImage: "hare.fill")
//                    .font(.largeTitle)
//                    .foregroundColor(.purple)
//                    .padding()
//                    .border(Color.yellow, width: 1)
//            }
//
//            Button {
//                // actions
//            } label: {
//                Image("parrot")
//                    .resizable()
//                    .frame(width: 160, height: 160)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
//            }
//        }.padding()
//    }
// }

// MARK: - Actions

/*
 When you store updated data in an ordinary variable, any other part of your program that uses that variable has no idea that the data has been updated. Making sure every part of your program receives any updated data stored in a variable can be tedious and error-prone. That’s why SwiftUI offers State variables to solve this problem.

 The moment you change the value of a State variable, anything that uses that State variable automatically gets the latest data stored in that State variable without the need to write any extra code. When a variable holds one value, it’s in one state, and when that same variable holds a different value, that’s a second state.
 */

struct ContentView: View {
    @State var colored = false
    
    var body: some View {
        VStack(spacing: 64) {
            Button {
                // Actions
                colored.toggle()
            } label: {
                Image("parrot")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(colored ? Color.yellow : Color.clear, lineWidth: 4))
            }

            Rectangle()
                .fill(colored ? Color.green : Color.gray)
                .frame(width: 240, height: 128)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
