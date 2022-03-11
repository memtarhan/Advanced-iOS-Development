//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 11/03/2022.
//

import SwiftUI

// MARK: Displaying Shapes

/*
 Capsule

 Circle

 Ellipse

 Rectangle

 RoundedRectangle(cornerRadius: x)
 */
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Capsule(style: .continuous)
            Circle()
            Ellipse()
            Rectangle()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
