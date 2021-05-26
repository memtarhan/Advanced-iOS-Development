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
                    .font(.largeTitle)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
