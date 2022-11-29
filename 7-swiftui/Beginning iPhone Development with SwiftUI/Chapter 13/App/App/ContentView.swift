//
//  ContentView.swift
//  App
//
//  Created by Mehmet Tarhan on 13/03/2022.
//

import SwiftUI

// MARK: - Using List

// struct ContentView: View {
//    var body: some View {
//        List {
//            ForEach(1 ... 25, id: \.self) { index in
//                Cell(title: "Animal #\(index)")
//            }
//        }
//    }
// }
//
// struct Cell: View {
//    @State var title = ""
//    var body: some View {
//        Text(title)
//            .foregroundColor(Color.purple)
//    }
// }

// MARK: - Displaying Array Data in a List

// struct ContentView: View {
//    var myArray = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
//
//    var body: some View {
//        List {
//            ForEach(0 ... myArray.count - 1, id: \.self) { index in
//                Text(myArray[index])
//            }
//        }
//    }
// }

// MARK: - Displaying Arrays of Structures in a List

// struct Animals: Identifiable {
//    let pet: String
//    let id = UUID()
// }
//
// struct ContentView: View {
//    var animals = [
//        Animals(pet: "Cat"),
//        Animals(pet: "Dog"),
//        Animals(pet: "Turtle"),
//        Animals(pet: "Ferret"),
//        Animals(pet: "Parrot"),
//        Animals(pet: "Goldfish"),
//        Animals(pet: "Lizard"),
//        Animals(pet: "Canary"),
//        Animals(pet: "Tarantula"),
//        Animals(pet: "Hamster"),
//    ]
//
//    var body: some View {
//        List(animals) {
//            Text($0.pet)
//        }
//    }
// }

// MARK: - Creating Groups in a List

// struct SectionHeading: Identifiable {
//    let name: String
//    let animalList: [Animals]
//    let id = UUID()
// }
//
// struct Animals: Hashable, Identifiable {
//    let pet: String
//    let id = UUID()
// }
//
// struct ContentView: View {
//    var animals = [
//        SectionHeading(name: "Mammals",
//                       animalList: [
//                           Animals(pet: "Cat"),
//                           Animals(pet: "Dog"),
//                           Animals(pet: "Ferret"),
//                           Animals(pet: "Hamster")]),
//        SectionHeading(name: "Reptiles",
//                       animalList: [
//                           Animals(pet: "Turtle"),
//                           Animals(pet: "Lizard")]),
//        SectionHeading(name: "Birds",
//                       animalList: [
//                           Animals(pet: "Parrot"),
//                           Animals(pet: "Canary")]),
//        SectionHeading(name: "Other",
//                       animalList: [
//                           Animals(pet: "Tarantula"),
//                           Animals(pet: "Goldfish")]),
//    ]
//    var body: some View {
//        List {
//            ForEach(animals) { heading in
//                Section(header: Text("\(heading.name) Section")) {
//                    ForEach(heading.animalList) { creature in
//                        Text(creature.pet)
//                    }
//                    .listRowSeparatorTint(.red)
//                    .listRowSeparator(.hidden)
//                }
//            }
//        }
//    }
// }

// MARK: - Adding Swipe Gestures to a List

/*
 In iOS 15, SwiftUI also allows custom left to right and right to left gestures on List items. The first step is to add a .swipeActions modifier to the view that displays items in a List such as a Text view. Then define whether you want a .leading (left to right) or .trailing (right to left) swipe gesture like this:
 .swipeActions(edge: .trailing)
 */

struct ContentView: View {
    @State var array = ["Cat", "Dog", "Turtle", "Ferret", "Parrot", "Goldfish", "Lizard", "Canary", "Tarantula", "Hamster"]
    @State var message = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(0 ... array.count - 1, id: \.self) { index in
                    Text(array[index])
                        .swipeActions(edge: .leading) {
                            Button {
                                message = "Item = \(array[index]) -- Index = \(index)"
                            } label: {
                                Image(systemName: "calendar.circle")
                            }.tint(.yellow)
                        }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Animals")
        }
    }

    func delete(at offsets: IndexSet) {
        array.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        array.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
