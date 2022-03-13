//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 13/03/2022.
//

import SwiftUI

// MARK: - Using List 
struct ContentView: View {
    var body: some View {
        List {
            ForEach(1 ... 25, id: \.self) { index in
                Cell(title: "Animal #\(index)")
            }
        }
    }
}

struct Cell: View {
    @State var title = ""
    var body: some View {
        Text(title)
            .foregroundColor(Color.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
