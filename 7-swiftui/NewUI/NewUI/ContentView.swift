//
//  ContentView.swift
//  NewUI
//
//  Created by Mehmet Tarhan on 27.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""

    var body: some View {
        VStack {
            TextField("Enter something...", text: $name)
                .padding()
            Text("Hello \(name)")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
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
