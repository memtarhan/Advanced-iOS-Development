//
//  ContentView.swift
//  Dates
//
//  Created by Mehmet Tarhan on 29/11/2022.
//

import SwiftUI

let baseURL = "https://worldtimeapi.org/api/timezone/Europe/Lisbon"

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    let week: Int
    let dayOfYear: Int

    private enum CodingKeys: String, CodingKey {
        case date = "utc_datetime"
        case week = "week_number"
        case dayOfYear = "day_of_year"
    }
}

struct ContentView: View {
    @State var dates = [CurrentDate]()

    var body: some View {
        NavigationView {
            List(dates) { date in
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
                        await addNewDate()
                    }

                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .task {
            await addNewDate()
        }
    }

    private func addNewDate() async {
        if let date = try? await getDate() {
            dates.append(date)
        }
    }

    private func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: baseURL) else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
