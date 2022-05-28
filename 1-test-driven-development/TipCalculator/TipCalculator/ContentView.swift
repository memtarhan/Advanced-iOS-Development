//
//  ContentView.swift
//  TipCalculator
//
//  Created by Mehmet Tarhan on 28/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var total: String = ""
    @State private var percentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                TextField("Enter total", text: $total)

                Picker(selection: $percentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }.pickerStyle(.segmented)

                Button("Calculate tip") {
                }
                .padding(.top, 20)
                .buttonStyle(.bordered)

                Text(message)
                    .padding(.top, 64)

                Spacer()

                Text(tip ?? "")
                    .font(.system(size: 45))

                Spacer()
                    .navigationTitle("Tip Calculator")
                    .navigationBarTitleDisplayMode(.large)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
