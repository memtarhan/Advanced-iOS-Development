//
//  ContentView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello SwiftUI")
                    .padding()
                Button(action: {
                }, label: {
                    Text("Tap Me!")
                })
            }
            HStack {
                Text("Hello World")
                    .padding()
                Button(action: {
                    print("DO NOT Tap Me!")
                }, label: {
                    Text("DO NOT Tap Me!")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
