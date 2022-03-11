//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 11/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is a non-limited Text, \n it has no line limit. \n It can do whatever it wants! \n Ha ha ha")
                .padding()
                .background(Color.yellow)

            Text("This is only \n 2 line Text")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding()
                .background(Color.yellow)
                .truncationMode(.tail)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
