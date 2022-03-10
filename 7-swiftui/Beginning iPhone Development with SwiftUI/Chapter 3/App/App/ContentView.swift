//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 10/03/2022.
//

import SwiftUI

// MARK: - Using the Padding Modifier

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Default padding of 16 points")
                    .padding()
                    .background(Color.yellow)
                Text("Padding of 45 points")
                    .padding(45)
                    .background(Color.yellow)
                Text("Padding of 3 points")
                    .padding(3)
                    .background(Color.yellow)
            }
            VStack {
                /*
                 .top

                 .bottom

                 .vertical (top and bottom)

                 .leading (left)

                 .trailing (right)

                 .horizontal (trailing and leading)
                 */

                Text("Top padding only")
                    .padding(.top)
                    .background(Color.yellow)
                Text("Bottom padding only")
                    .padding(.bottom)
                    .background(Color.yellow)
                Text("Vertical padding")
                    .padding(.vertical)
                    .background(Color.yellow)

                Text("Top and leading")
                    .padding([.top, .leading], 30)
                    .background(Color.yellow)

                Text("Trailing with custom parameter")
                    .padding(.trailing, 30)
                    .background(Color.yellow)

            }.padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
