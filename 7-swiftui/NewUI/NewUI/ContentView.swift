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
            Text("Hello SwiftUI")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .multilineTextAlignment(.center)
                .padding()
            
            Image("swiftui")
                .aspectRatio(contentMode: .fit)
                .padding(.all, 24.0)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
