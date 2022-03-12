//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 12/03/2022.
//

import SwiftUI

// MARK: - Defining a Button

struct ContentView: View {
    var body: some View {
        VStack(spacing: 64) {
            Button("Click here") {
                // actions
            }
            Button {
                // actions
            } label: {
                Text("Customized button")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
                    .border(Color.red, width: 6)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Button {
                // actions
            } label: {
                Label("With Label", systemImage: "hare.fill")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .padding()
                    .border(Color.yellow, width: 1)
            }

            Button {
                // actions
            } label: {
                Image("parrot")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
