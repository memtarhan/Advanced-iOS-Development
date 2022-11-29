//
//  ContentView.swift
//  Dates
//
//  Created by Mehmet Tarhan on 29/11/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dates) { date in
                VStack(alignment: .leading) {
                    Text("\(date.date)")
                    HStack {
                        Text("WEEK:")
                            .font(.subheadline)
                        Text("\(date.week)")
                            .font(.headline)
                    }
                    HStack {
                        Text("DAY OF YEAR:")
                            .font(.subheadline)
                        Text("\(date.dayOfYear)")
                            .font(.headline)
                    }
                }
            }
            .listStyle(.plain)

            .navigationTitle("Dates")
            .toolbar {
                Button {
                    Task {
                        await viewModel.loadCurrentDate()
                    }

                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .task {
            await viewModel.loadCurrentDate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
